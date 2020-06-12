#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new squad
 */

params [["_baseGroup", grpNull]];

// Exit if not called on server
if !(isServer) exitWith {locationNull};

LOG_1("Creating new squad (baseGroup: %1)",str _baseGroup);

private _squad = true call CBA_fnc_createNamespace;

// Setup squad based on given group
if !(isNull _baseGroup) then {
  _squad setVariable ["units", _units, true];
  _squad setVariable ["leader", leader _baseGroup, true];

  // Update squad on group units
  {
    _x setVariable [QGVAR(squad), _squad, true];
    LOG_2("Assigning unit %1 to created squad (baseGroup: %2)",str _x,str _baseGroup);
  } forEach _units;

  // Save group-squad references for server
  _squad setVariable [QGVAR(group), _baseGroup];
  _baseGroup setVariable [QGVAR(squad), _squad];
};

_squad
