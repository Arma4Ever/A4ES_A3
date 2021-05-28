#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Change task state action for handler modules
 */

params ["_logic"];

if (_logic getVariable [QGVAR(changeTaskState), false]) then {
  private _task = _logic getVariable [QGVAR(task), ""];
  if (_task isEqualTo "") exitWith {
    ERROR_2("%1 [%2] - abort setTaskState, missing task",str _logic,typeOf _logic);
  };

  private _delay = _logic getVariable [QGVAR(taskStateDelay), 0];
  [{
    _this call EFUNC(tasks,setTaskState);
  }, [
    _task,
    _logic getVariable [QGVAR(taskState), 0],
    _logic getVariable [QGVAR(taskShowNotification), true]
  ], _delay] call CBA_fnc_waitAndExecute;
};
