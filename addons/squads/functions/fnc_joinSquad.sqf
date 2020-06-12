#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Joins unit to given squad
 */

params ["_unit", "_newSquad"];

// Exit if not server or null squad
if (!isServer || isNull _newSquad) exitWith {};

private _currentSquad = _unit call FUNC(getUnitSquad);
private _updatedSquads = [];

// Update current unit squad
if !(isNull _currentSquad) then {
  // Update squad units
  private _currentSquadUnits = _currentSquad getVariable [QGVAR(units), []];
  _currentSquadUnits = _currentSquadUnits - [_unit];

  if (_currentSquadUnits isEqualTo []) then {
    // Delete empty squad
    _currentSquad call FUNC(deleteSquad);
  } else {
    // Update squad units if squad is not empty
    _currentSquad setVariable [QGVAR(units), _currentSquadUnits, true];

    // Update squad leader if leaving unit was one
    private _currentSquadLeader = _currentSquad getVariable [QGVAR(leader), objNull];
    if (_currentSquadLeader isEqualTo _unit) then {
      private _newSquadLeader = _currentSquadUnits # 0;
      _currentSquad setVariable [QGVAR(leader), _newSquadLeader, true];
    };

    _updatedSquads pushBack _currentSquad;
  };
};

// Set unit squad
_unit setVariable [QGVAR(squad), _newSquad, true];

// Update new unit squad
private _newSquadUnits = _newSquad getVariable [QGVAR(units), []];
_newSquadUnits pushback _unit;
_newSquad setVariable [QGVAR(units), _newSquadUnits, true];
_updatedSquads pushBack _newSquad;

// Send event for clients
[QGVAR(squadsUpdated), _updatedSquads] call CBA_fnc_globalEvent;
