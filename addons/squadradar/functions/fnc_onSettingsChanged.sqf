#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles settings change event
 */

LOG_2("Settings changed (enable: %1 enabled: %2)",str GVAR(enable),str GVAR(enabled));

if (GVAR(enable) && !GVAR(enabled)) exitWith {
  QGVAR(RscRadar) cutRsc [QGVAR(RscRadar), "PLAIN", 0, false];
};

if ((!GVAR(enable) || {isNull GVAR(currentSquad)) && GVAR(enabled)) exitWith {
  LOG_3("Unloading radar (enable: %1 enabled: %2 curretSquad: %3)",str GVAR(enable),str GVAR(enabled),str GVAR(currentSquad));
  QGVAR(RscRadar) cutText ["", "PLAIN"];
};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
if (isNull _display) exitWith {};

private _ctrlRadarBg = _display displayCtrl IDC_RSCRADAR_RADARBG;

// Set radar background
_ctrlRadarBg ctrlSetText GVAR(radarBackground);
_ctrlRadarBg ctrlSetTextColor [1, 1, 1, GVAR(radarBackgroundOpacity)];

// Refresh members cache & redraw memberlist
true call FUNC(drawMemberlist);
