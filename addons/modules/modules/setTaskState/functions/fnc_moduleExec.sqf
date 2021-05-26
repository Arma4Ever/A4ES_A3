#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * createTask module exec function
 */

params ["_logic"];
TRACE_1("setTaskState_moduleExec",_logic);

if !(isServer) exitWith {};

private _task =  _logic getVariable [QGVAR(task), ""];
if (_task isEqualTo "") exitWith {
  ERROR("Task is missing");
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Set task state
[
  _task,
  _logic getVariable [QGVAR(state), 0],
  _logic getVariable [QGVAR(showNotification), true]
] call EFUNC(tasks,setTaskState);

// Delete module
deleteVehicle _logic;
