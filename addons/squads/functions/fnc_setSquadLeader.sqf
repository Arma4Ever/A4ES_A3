#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Marks given unit as squad leader
 */

params ["_unit"];

// Exit if not server
if (!isServer) exitWith {};

private _squad = _unit call FUNC(getUnitSquad);

// Exit if unit has no squad
if (isNull _squad) exitWith {};

_squad setVariable ["leader", _unit, true];

// Send event for clients
[QGVAR(squadsUpdated), [_squad]] call CBA_fnc_globalEvent;
