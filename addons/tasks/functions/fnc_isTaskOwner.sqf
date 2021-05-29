#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks is given unit a task owner
 */

params ["_unit", "_owner"];

// All players
if (_owner isEqualTo 0) exitWith {true};

// Later conditions require _unit so check null here
if (isNull _unit) exitWith {false};

// Owner is units list
if (_owner isEqualType []) exitWith {_unit in _owner};

private _unitSide = side (group _unit);

// Player is curator/spectator
if (_unitSide isEqualTo sideLogic) exitWith {true};

private _ownerSide = ([
  west,
  east,
  independent,
  civilian
] param [_ownerId - 1, sideUnknown]);

_ownerSide isEqualTo _unitSide
