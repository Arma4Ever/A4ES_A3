#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * createTask module exec function
 */

params ["_logic"];
TRACE_1("createTask_moduleExec",_logic);

if !(isServer) exitWith {};

private _id =  _logic getVariable [QGVAR(id), ""];
if (_id isEqualTo "") exitWith {
  ERROR("Task id is missing");
};

private _title = _logic getVariable [QGVAR(title), ""];
if (_title isEqualTo "") exitWith {
  ERROR("Task title is missing");
};

private _pos = [];
if (_logic getVariable [QGVAR(showPos), true]) then {
  _pos = getPos _logic;
};

// Create task
[
  [
    _id,
    _logic getVariable [QGVAR(parent), ""],
    _logic getVariable [QGVAR(owner), 0],
    _title,
    _logic getVariable [QGVAR(description), ""],
    _logic getVariable [QGVAR(type), "default"],
    _pos,
    _logic getVariable [QGVAR(state), 0]
  ],
  _logic getVariable [QGVAR(showNotification), true]
] call EFUNC(tasks,createTask);

// Delete module
deleteVehicle _logic;
