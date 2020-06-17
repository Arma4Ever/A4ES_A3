#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks & update squad radar ui according to current situation
 */

params [["_settingsChanged", false, [false]]];

LOG_3("Updating UI (settingsChanged: %1 enable: %2 enabled: %3 currentSquad %4)",str _settingsChanged,str GVAR(enable),str GVAR(enabled),str GVAR(currentSquad));

if (_settingsChanged) then {
  // Update scale vars
  private _resolution = getResolution;
  private _screenHeight = _resolution # 1;
  private _uiScale = _resolution # 5;
  GVAR(uiScale) = 0.55 / _uiScale;
  GVAR(uiHScale) = 900 / _screenHeight;
  GVAR(mapZoomScale) = _screenHeight / 900;
  GVAR(radarIconSize) = 15 * GVAR(uiScale);
};

// Remove RscRadar
if ((!GVAR(enable) || {isNull GVAR(currentSquad)}) && GVAR(enabled)) exitWith {
  LOG("Unloading radar");
  QGVAR(RscRadar) cutText ["", "PLAIN"];
  GVAR(enabled) = false;
  [GVAR(drawCachePFH)] call CBA_fnc_removePerFrameHandler;
};

// Create RscRadar
if (GVAR(enable) && !GVAR(enabled) && {!(isNull GVAR(currentSquad))}) then {
  QGVAR(RscRadar) cutRsc [QGVAR(RscRadar), "PLAIN", 0, false];
  GVAR(drawCachePFH) = [DFUNC(refreshDrawCache), 0.25, []] call CBA_fnc_addPerFrameHandler;
};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
// Exit if radar not created
if (isNull _display) exitWith {
  LOG("Skipping update of UI elements, RscRadar is null");
};

private _ctrlRadar = _display displayCtrl IDC_RSCRADAR_RADAR;
private _ctrlRadarBg = _display displayCtrl IDC_RSCRADAR_RADARBG;
private _ctrlMemberlist = _display displayCtrl IDC_RSCRADAR_MEMBERLIST;

// Update radar background
if (_settingsChanged) then {
  _ctrlRadarBg ctrlSetText GVAR(radarBackground);
  _ctrlRadarBg ctrlSetTextColor [1, 1, 1, GVAR(radarBackgroundOpacity)];
};

// Termine which UI elements should be visible
private _isUnconscious = ace_player getVariable ["ACE_isUnconscious", false];
private _showRadar = (
  GVAR(showRadar)
  && {!GVAR(displayInterrupt)}
  && {(vehicle ace_player) isEqualTo ace_player}
  && {!_isUnconscious}
  && {alive ace_player}
);
private _showMemberlist = (GVAR(showMemberlist) && {!GVAR(displayInterrupt)} && {!_isUnconscious} && {alive ace_player});

// Update visiblity
_ctrlRadar ctrlShow _showRadar;
_ctrlRadarBg ctrlShow _showRadar;
_ctrlMemberlist ctrlShow _showMemberlist;

LOG_2("UI elements updated (showRadar: %1 showMemberlist: %2)",str _showRadar,str _showMemberlist);

// Refresh members cache & redraw memberlist in case of column with change
// or initial draw
if (_settingsChanged) then {
  true call FUNC(drawMemberlist);
};
