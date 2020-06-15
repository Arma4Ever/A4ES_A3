#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles settings change event
 */

LOG_3("Settings changed (enable: %1 enabled: %2 currentSquad %3)",str GVAR(enable),str GVAR(enabled),str GVAR(currentSquad));

if ((!GVAR(enable) || {isNull GVAR(currentSquad)}) && GVAR(enabled)) exitWith {
  LOG_3("Unloading radar (enable: %1 enabled: %2 curretSquad: %3)",str GVAR(enable),str GVAR(enabled),str GVAR(currentSquad));
  QGVAR(RscRadar) cutText ["", "PLAIN"];
  GVAR(enabled) = false;
  [GVAR(radarDrawCachePFH)] call CBA_fnc_removePerFrameHandler;
};

if (GVAR(enable) && !GVAR(enabled) && {!(isNull GVAR(currentSquad))}) then {
  QGVAR(RscRadar) cutRsc [QGVAR(RscRadar), "PLAIN", 0, false];
  GVAR(radarDrawCachePFH) = [DFUNC(refreshRadarDrawCache), 0.25, []] call CBA_fnc_addPerFrameHandler;
};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
if (isNull _display) exitWith {};

private _ctrlRadarBg = _display displayCtrl IDC_RSCRADAR_RADARBG;

// Set radar background
_ctrlRadarBg ctrlSetText GVAR(radarBackground);
_ctrlRadarBg ctrlSetTextColor [1, 1, 1, GVAR(radarBackgroundOpacity)];

// Refresh members cache & redraw memberlist
true call FUNC(drawMemberlist);
