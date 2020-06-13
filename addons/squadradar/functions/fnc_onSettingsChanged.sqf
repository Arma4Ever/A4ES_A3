#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles settings change event
 */

if (GVAR(enable) && !GVAR(enabled)) exitWith {
  QGVAR(RscRadar) cutRsc [QGVAR(RscRadar), "PLAIN", 0, false];
};

if (!GVAR(enable) && GVAR(enabled)) exitWith {
  QGVAR(RscRadar) cutText ["", "PLAIN"];
};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
if (isNull _display) exitWith {};

//TODO Update radar background & opacity

//TODO redraw memberlist
