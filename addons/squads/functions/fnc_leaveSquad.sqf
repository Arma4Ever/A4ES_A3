#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes given unit from current squad
 */

params ["_unit", ["_sendChangedEvent", true, [true]]];

// Exit if not server
if (!isServer) exitWith {false};

private _squad = _unit call FUNC(getUnitSquad);
private _squadDeleted = false;

// Exit if unit has no squad
if (isNull _squad) exitWith {false};

// Update squad units
private _squadUnits = _squad getVariable ["units", []];
_squadUnits = _squadUnits - [_unit];

if (_squadUnits isEqualTo []) then {
  // Delete empty squad
  _squad call FUNC(deleteSquad);
  _squadDeleted = true;
} else {
  // Update squad units if squad is not empty
  _squad setVariable ["units", _squadUnits, true];

  // Update squad leader if leaving unit was one
  private _squadLeader = _squad getVariable ["leader", objNull];
  if (_squadLeader isEqualTo _unit) then {
    _squad setVariable [
      "leader",
      _squadUnits call EFUNC(nametags,selectHighestRankUnit),
      true
    ];
  };

  // Send squads update event
  if (_sendChangedEvent) then {
    [_squad] call FUNC(triggerSquadChanged);
  };
};

// Reset unit squad
_unit setVariable [QGVAR(squad), objNull, true];

if (_sendChangedEvent) then {
  // Send squad change event to leaving player
  [_unit] call FUNC(triggerSquadChanged);
};

// Remove unit if it's a dummy unit
if (_unit isKindOf "VirtualSpectator_F") then {
  LOG_1('Removing dummy unit "%1".',str _unit);
  private _unitGroup = group _unit;
  deleteVehicle _unit;
  if (local _unitGroup && {(side _unitGroup) isEqualTo sideLogic}) then {
    LOG_1('Removing dummy unit group "%1".',str _unitGroup);
    deleteGroup _unitGroup;
  };
};

_squadDeleted
