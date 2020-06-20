#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Joins unit to given squad
 */

params ["_unit", "_target"];

// Exit if not server or null squad
if (!isServer) exitWith {};

private _currentSquad = _unit call FUNC(getUnitSquad);
private _changedSquads = [];

// Update current unit squad
if !(isNull _currentSquad) then {
  // Add squad to changed squads if squad was not deleted after unit leaving
  if !([_unit, false] call FUNC(leaveSquad)) then {
    _changedSquads pushBack _currentSquad;
  };
};

private _targetSquad = _target call FUNC(getUnitSquad);
private _targetSquadUnits = _targetSquad getVariable ["units", []];

// Create new squad if target has no squad
if (isNull _targetSquad) then {
  _targetSquad = [] call FUNC(createSquad);
  _targetSquad setVariable [
    "leader",
    [_unit, _target] call EFUNC(nametags,selectHighestRankUnit),
    true
  ];
  // Set target unit squad
  _target setVariable [QGVAR(squad), _targetSquad, true];
  _targetSquadUnits = [_target];
};

// Set unit squad
_unit setVariable [QGVAR(squad), _targetSquad, true];

// Update squad units
_targetSquadUnits pushback _unit;
_targetSquad setVariable ["units", _targetSquadUnits, true];
_changedSquads pushBack _targetSquad;

LOG_3("Unit %1 joined squad of %2 (changed squads: %3)",str _unit,str _target,str _changedSquads);

// Send event for clients
_changedSquads call FUNC(triggerSquadChanged);
