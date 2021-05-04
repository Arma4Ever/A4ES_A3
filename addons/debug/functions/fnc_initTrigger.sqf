#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers trigger for mission debug
 */

params ["_trigger"];

private _statements = triggerStatements _trigger;
_trigger setTriggerStatements [
  (_statements # 0),
  ((format ["[thisTrigger, true] call %1;", QFUNC(updateTrigger)]) + (_statements # 1)),
  ((format ["[thisTrigger, false] call %1;", QFUNC(updateTrigger)]) + (_statements # 2))
];
