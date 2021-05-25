#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks is given unit a task owner
 */

params ["_unit", "_ownerId"];

private _unitSide = side (group _unit);

// All players or player is curator
if (
  (_ownerId isEqualTo 0) ||
  {_unitSide isEqualTo sideLogic}
) exitWith {true};

private _ownerSide = ([
  west,
  east,
  independent,
  civilian
] param [_ownerId - 1, sideUnknown]);

_ownerSide isEqualTo _unitSide
