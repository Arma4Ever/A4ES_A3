#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_unit"];

// Exit if killed unit is not local
if (!(local _unit)) exitWith {};

[QGVAR(respawn), _this] call CBA_fnc_serverEvent;
