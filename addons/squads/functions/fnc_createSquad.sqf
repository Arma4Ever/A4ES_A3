#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new squad
 */

params [["_baseGroup", grpNull]];

// Exit if not called on server
if !(isServer) exitWith {locationNull};

private _squad = true call CBA_fnc_createNamespace;

// Setup squad based on given group
if !(isNull _baseGroup) then {
  _squad setVariable [QGVAR(group), _baseGroup, true];
  _squad setVariable [QGVAR(units), _units, true];
  _squad setVariable [QGVAR(leader), leader _baseGroup, true];

  // Update squad on group units
  {
    _x setVariable [QGVAR(squad), _squad, true];
  } forEach _units;

  // Save squad in group
  _baseGroup setVariable [QGVAR(squad), _squad, true];
};

_squads = missionNamespace getVariable [QGVAR(allSquads), []];
_squads pushBack _squad;
missionNamespace setVariable [QGVAR(allSquads), _squads];

_squad
