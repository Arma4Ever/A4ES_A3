#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_newUnit", "_oldUnit"];

// Exit if killed unit is not local
if (!(local _newUnit)) exitWith {};

[QGVAR(respawn), _this] call CBA_fnc_serverEvent;
