#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can throw grenade in target tank
 */

params ["_target", "_player"];

if !(
  (_target isKindOf "Tank") &&
  {(crew _target) isNotEqualTo []} &&
  {((side (group (effectiveCommander _target))) getFriend (side (group _player))) < 0.6}
) exitWith {false};

private _comTurretModelPos = _target selectionPosition "commander_turret";
if (_comTurretModelPos isEqualTo [0, 0, 0]) then {
  _comTurretModelPos = [0, 0, 0.3];
};

((_player modelToWorld [0,0,0]) distance (
  _target modelToWorldVisual _comTurretModelPos
)) < 2.5
