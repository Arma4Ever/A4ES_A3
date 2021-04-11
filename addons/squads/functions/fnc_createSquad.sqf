#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new squad
 */

params [["_baseGroup", grpNull]];

// Exit if not called on server
if !(isServer) exitWith {objNull};

// Exit with new empty squad if there's no base group
if (isNull _baseGroup) exitWith {
  LOG("Creating new empty squad");
  true call CBA_fnc_createNamespace
};

// Setup squad based on given group
private _units = units _baseGroup;

// Exit if there's less than 2 units in group
if ((count _units) < 2) exitWith {
  LOG_2("Skipping creating new empty squad based on group %1, less than 2 units (units: %2)",str _baseGroup,str _units);
  objNull
};

private _squad = true call CBA_fnc_createNamespace;

LOG_2("Creating new squad based on group %1 (units: %2)",str _baseGroup,str _units);

_squad setVariable ["units", _units, true];
_squad setVariable ["leader", leader _baseGroup, true];

private _groupName = groupId _baseGroup;
if (_groupName isNotEqualTo "") then {
  _squad setVariable ["name", _groupName, true];
};

// Update squad on group units
{
  _x setVariable [QGVAR(squad), _squad, true];
} forEach _units;

// Save group-squad references for server
_squad setVariable [QGVAR(group), _baseGroup];
_baseGroup setVariable [QGVAR(squad), _squad];

_squad
