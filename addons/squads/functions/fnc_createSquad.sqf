#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new squad
 */

params [["_baseGroup", grpNull]];

// Exit if not called on server
if !(isServer) exitWith {objNull};

// Setup squad based on given group
if !(isNull _baseGroup) exitWith {
  private _units = units _baseGroup;

  // Exit if there's only one unit in group
  if !((count _units) > 1) exitWith {objNull};

  private _squad = true call CBA_fnc_createNamespace;

  LOG_2("Creating new squad based on group %1 (units: %2)",str _baseGroup,str _units);

  _squad setVariable ["units", _units, true];
  _squad setVariable ["leader", leader _baseGroup, true];

  // Update squad on group units
  {
    _x setVariable [QGVAR(squad), _squad, true];
  } forEach _units;

  // Save group-squad references for server
  _squad setVariable [QGVAR(group), _baseGroup];
  _baseGroup setVariable [QGVAR(squad), _squad];

  _squad
};

LOG("Creating new empty squad");

true call CBA_fnc_createNamespace
