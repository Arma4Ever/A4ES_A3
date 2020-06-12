#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns squad units
 */

params ["_squad"];

if (isNull _squad) exitWith {[]};
_squad getVariable [QGVAR(units), []]
