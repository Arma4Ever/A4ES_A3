#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns squad leader
 */

params ["_squad"];

if (isNull _squad) exitWith {objNull};
_squad getVariable [QGVAR(leader), objNull]
