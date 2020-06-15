#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given units are in same squad
 */

// Exit early if given less than 2 units to compare
if !((count _this) > 1) exitWith {
  [false, true] select (count _this);
};

private _firstUnit = _this deleteAt 0;

private _squad = _firstUnit call FUNC(getUnitSquad);
// Exit early if first unit squad is null
if (isNull _squad) exitWith {false};

private _squadUnits = _squad call FUNC(getSquadUnits);

({!(_x in _squadUnits)} count _this) isEqualTo 0
