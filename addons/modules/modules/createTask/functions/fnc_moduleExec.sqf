#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * createTask module exec function
 */

params ["_logic"];
TRACE_1("createTask_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

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

private _owner = _logic getVariable [QGVAR(owner), 0];
if (_owner isEqualTo 5) then {
  _owner = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};
};

// Create task
[
  [
    _id,
    _logic getVariable [QGVAR(parent), ""],
    _owner,
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
