#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onHour module exec function - called by activator - add hour condition
 */

params ["_logic"];
TRACE_1("onHour_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};

private _hour = _logic getVariable [QGVAR(hour), 0];
private _minute = _logic getVariable [QGVAR(minute), 0];

private _condition = format [
  "private _date = date;((_date # 3) isEqualTo %1) && {((_date # 4) isEqualTo %2)}",
  _hour,
  _minute
];

TRACE_4("onHour_moduleExec - time cond added to activator",_logic,_hour,_minute,_condition);

[
  _logic,
  _condition,
  _logic,
  QFUNC(onHour_moduleExecExec),
  0
] call FUNC(addModuleToActivator);
