#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns logic area
 */

params ["_logic"];

private _area = [getPos _logic];
_area append (_logic getVariable ["objectarea", [0, 0, 0, false, 0]]);

_area
