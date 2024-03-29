#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks & update squad radar ui according to current situation
 */

params [["_settingsChanged", false, [false]]];

LOG_4("Updating UI (settingsChanged: %1 enable: %2 enabled: %3 showCurrentSquad %4)",str _settingsChanged,str GVAR(enable),str GVAR(enabled),str GVAR(showCurrentSquad));

// Remove RscRadar
if ((!GVAR(enable) || !GVAR(showCurrentSquad) || GVAR(disabledInMission)) && GVAR(enabled)) exitWith {
  LOG("Unloading radar");
  QGVAR(RscRadar) cutText ["", "PLAIN"];
  GVAR(enabled) = false;
  [GVAR(drawCachePFH)] call CBA_fnc_removePerFrameHandler;
};

// Create RscRadar
if (GVAR(enable) && !GVAR(enabled) && GVAR(showCurrentSquad) && !GVAR(disabledInMission)) then {
  // Initial refresh of members data
  call FUNC(refreshMembersData);
  QGVAR(RscRadar) cutRsc [QGVAR(RscRadar), "PLAIN", 0, false];
  GVAR(drawCachePFH) = [{0 call FUNC(refreshDrawCache)}, 0.33] call CBA_fnc_addPerFrameHandler;
};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
// Exit if radar not created
if (isNull _display) exitWith {
  LOG("Skipping update of UI elements, RscRadar is null");
};

private _ctrlRadar = _display displayCtrl IDC_RSCRADAR_RADAR;
private _ctrlRadarBg = _display displayCtrl IDC_RSCRADAR_RADARBG;
private _ctrlFingerPointers = _display displayCtrl IDC_RSCRADAR_FINGER_POINTERS;
private _ctrlMemberlist = _display displayCtrl IDC_RSCRADAR_MEMBERLIST;

// Update radar size & background
if (_settingsChanged) then {
  // Update scale vars
  private _resolution = getResolution;
  private _screenHeight = _resolution # 1;
  private _settingsUIScale = 0.55 / (_resolution # 5);

  GVAR(memberlistHScale) = (900 / _screenHeight) * GVAR(uiScale);
  GVAR(radarIconSize) = RADAR_BASE_ICON_SIZE * _settingsUIScale * GVAR(uiScale);

  private _radarW = pixelW * 128 * GVAR(uiScale);
  private _radarH = pixelH * 128 * GVAR(uiScale);
  private _radarPos = [
    0.5 - (_radarW / 2),
    safeZoneY + safeZoneH - (_radarH + (pixelH * 10)),
    _radarW,
    _radarH
  ];

  _ctrlRadarBg ctrlSetText GVAR(radarBackground);
  _ctrlRadarBg ctrlSetTextColor [1, 1, 1, GVAR(radarBackgroundOpacity)];
  _ctrlRadarBg ctrlSetPosition _radarPos;
  _ctrlRadarBg ctrlCommit 0;

  _ctrlRadar ctrlSetPosition _radarPos;
  _ctrlRadar ctrlCommit 0;

  _ctrlFingerPointers ctrlSetPosition _radarPos;
  _ctrlFingerPointers ctrlCommit 0;

  _ctrlMemberlist ctrlSetPosition [
    0.5 + (_radarW / 2),
    safeZoneY + safeZoneH - (_radarH + (pixelH * 2)),
    (safeZoneW / 2) - (_radarW / 2),
    _radarH
  ];
  _ctrlMemberlist ctrlCommit 0;

  // Adjust map zoom
  private _mapZoomScale = _screenHeight / 900;
  private _mapZoom = linearConversion [1, 2, GVAR(uiScale), 15.5, 7.5, false];
  _ctrlRadar ctrlMapAnimAdd [
    0,
    1 / (worldsize / (22 * _mapZoom * _mapZoomScale)),
    // Counter arma bug with broken pos after map resize
    GVAR(radarPos) vectorAdd [(1 - GVAR(uiScale)) * 32.25 * _mapZoomScale, 0, 0]
  ];
  ctrlMapAnimCommit _ctrlRadar;
};

// Termine which UI elements should be visible
private _isUnconscious = ace_player getVariable ["ACE_isUnconscious", false];
private _showRadar = (
  GVAR(showRadar)
  && {!GVAR(displayInterrupt)}
  && {!EGVAR(ui,screenshotModeEnabled)}
  && {isNull (objectParent ace_player)}
  && {!_isUnconscious}
  && {alive ace_player}
);
private _showMemberlist = (
  GVAR(showMemberlist)
  && {!GVAR(displayInterrupt)}
  && {!EGVAR(ui,screenshotModeEnabled)}
  && {!_isUnconscious}
  && {alive ace_player}
);

// Jamming vars
private _jamRadar = ace_player getVariable [QGVAR(jamRadar), false];
private _jamMemberlist = ace_player getVariable [QGVAR(jamMemberlist), false];
private _jamAnimation = ace_player getVariable [QGVAR(jamAnimation), false];

// Radar jamming
if (_jamRadar) then {
  if (GVAR(radarJammed)) exitWith {};
  if (_jamAnimation && _showRadar) then {
    [[_ctrlRadar, _ctrlRadarBg, _ctrlFingerPointers], QUOTE(!GVAR(radarJammed))] call FUNC(animateJamming);
  } else {
    _ctrlRadar ctrlShow false;
    _ctrlRadarBg ctrlShow false;
    _ctrlFingerPointers ctrlShow false;
  };
  GVAR(radarJammed) = true;
} else {
  if !(GVAR(radarJammed)) exitWith {};
  GVAR(radarJammed) = false;
};

// Memberlist jamming
if (_jamMemberlist) then {
  if (GVAR(memberlistJammed)) exitWith {};
  if (_jamAnimation && _showMemberlist) then {
    [[_ctrlMemberlist], QUOTE(!GVAR(memberlistJammed))] call FUNC(animateJamming);
  } else {
    _ctrlMemberlist ctrlShow false;
  };
  GVAR(memberlistJammed) = true;
} else {
  if !(GVAR(memberlistJammed)) exitWith {};
  GVAR(memberlistJammed) = false;
};

// Update visiblity
if !(GVAR(radarJammed)) then {
  _ctrlRadar ctrlShow _showRadar;
  _ctrlRadarBg ctrlShow _showRadar;
  _ctrlFingerPointers ctrlShow _showRadar;
};
if !(GVAR(memberlistJammed)) then {
  _ctrlMemberlist ctrlShow _showMemberlist;
};

LOG_4("UI elements updated (showRadar: %1 showMemberlist: %2 radarJammed: %3 memberlistJammed: %4)",str _showRadar,str _showMemberlist,str GVAR(radarJammed),str GVAR(memberlistJammed));

// Refresh members cache & redraw memberlist in case of column width change
// or initial draw
if (_settingsChanged) then {
  true call FUNC(drawMemberlist);
};
