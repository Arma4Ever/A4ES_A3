#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves body data and begins body observation
 */

params ["_unit"];
TRACE_1("saveBodyData",_unit);

// Function is called after timeout, exit if unit is already null
if (isNull _unit) exitWith {};

private _pos = getPos _unit;
// Don't replace bodies in water
if (surfaceIsWater _pos) exitWith {};

private _headPos = _unit modelToWorld (_unit selectionPosition ["head", "HitPoints"]);
private _pelvisPos = _unit modelToWorld (_unit selectionPosition ["pelvis", "HitPoints"]);
private _headH = _headPos # 2;

private _bodyPos = switch true do {
  // lying on left arm
	case ((((_unit modelToWorld (_unit selectionPosition ["rightarm", "HitPoints"])) # 2) - _headH) > 0.23): {3};
  // lying on right arm
  case ((((_unit modelToWorld (_unit selectionPosition ["leftarm", "HitPoints"])) # 2) - _headH) > 0.23): {2};
  // lying on chest
  case (
    (_pelvisPos # 2) > _headH &&
    {((_unit modelToWorld (_unit selectionPosition ["spine2", "HitPoints"])) # 2) > _headH} &&
    {((_unit modelToWorld (_unit selectionPosition ["spine3", "HitPoints"])) # 2) > _headH}
  ): {1};
  // lying on back
	default {0};
};

_unit setVariable [QGVAR(bodyData), [
  _pos,
  _pelvisPos getDir _headPos,
  uniform _unit,
  face _unit,
  name _unit,
  _bodyPos
]];

private _delEH = _unit addEventHandler ["deleted", {_this call FUNC(handleDeleted);}];
_unit setVariable [QGVAR(deletedEH), _delEH];

private _script = _unit spawn {
  private _h = (getPos _this) # 2;
  waitUntil {
    sleep 1;
    (isNull _this) || {((getPos _this) # 2) < _h}
  };
  // Exit if unit is null - handled by deleted EH
  if (isNull _this) exitWith {};
  _this call FUNC(handleHidden);
};
_unit setVariable [QGVAR(obvScript), _script];
