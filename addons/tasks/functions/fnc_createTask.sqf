#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new task globally (and jip)
 */

params ["_taskData", "_showNotification"];
_taskData params ["_id", "_parentId", "_owner", "_title", "", "", "", "_state"];
TRACE_2("createTask",_taskData,_showNotification);

private _createdTasks = GVAR(createdTasks);

// Exit if task already created - should not happen
if (_id in _createdTasks) exitWith {};

// Delay task creation until parent is created
if (
  (_parentId isNotEqualTo "") &&
  {!(_parentId in _createdTasks)}
) exitWith {
  TRACE_2("createTask - task creation delayed, parent not created",_id,_parentId);
  private _awaiting = GVAR(awaitingTasksServer) getOrDefault [_parentId, []];
  _awaiting pushBack _this;
  GVAR(awaitingTasksServer) set [_parentId, _awaiting];
};

_createdTasks pushBack _id;
[QGVAR(createTask), _taskData] call CBA_fnc_globalEventJIP;

// Send notification if not mission start
if (_showNotification) then {
  [_id, _state] call FUNC(showTaskNotification);
};

// Create awaiting tasks
if (_id in GVAR(awaitingTasksServer)) then {
  private _tasks = GVAR(awaitingTasksServer) get _id;
  TRACE_2("createTask - creating awaiting tasks",_id,_tasks);
  GVAR(awaitingTasksServer) deleteAt _id;

  {
    _x call FUNC(createTask);
  } forEach _tasks;
};
