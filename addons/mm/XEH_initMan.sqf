/*
 * Author: SzwedzikPL
 * Man init EH
 */
#include "script_component.hpp"

params ["_unit"];

if(!local _unit) exitWith {};

[DFUNC(loadSpecialStates), [_unit], 3] call ace_common_fnc_waitAndExecute;
