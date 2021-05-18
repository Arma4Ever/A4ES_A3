#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers trigger for mission debug
 */

params ["_trigger"];

TRACE_1("initTrigger",_trigger);

private _statements = triggerStatements _trigger;
_trigger setTriggerStatements [
  (_statements # 0),
  ((format ["[thisTrigger, true] call %1;", QFUNC(updateTriggerStatus)]) + (_statements # 1)),
  ((format ["[thisTrigger, false] call %1;", QFUNC(updateTriggerStatus)]) + (_statements # 2))
];

private _area = triggerArea _trigger;

GVAR(triggersDrawData) pushBack [
  _trigger,
  getPos _trigger,
  [0, 0, 0.9, 1],
  _area # 0,
  _area # 1,
  _area # 2,
  _area # 3,
  synchronizedObjects _trigger
];
