#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggers leaveSquad
 */

params ["_unit"];

[QGVAR(leaveSquad), [_unit, true]] call CBA_fnc_serverEvent;
