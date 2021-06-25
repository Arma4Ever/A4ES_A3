#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates new task on client
 */

params ["_id", "_parentId", "_owner", "_title", "_description", "_type", "_pos", "_state"];
TRACE_8("createTaskLocal",_id,_parentId,_owner,_title,_description,_type,_pos,_state);

if !(hasInterface) exitWith {};

// Exit if player is not task owner
if !([player, _owner] call FUNC(isTaskOwner)) exitWith {
  GVAR(rejectedTasks) pushBack _id;

  // Delete awaiting notification if present
  private _awaitingNotifications = GVAR(awaitingNotifications);
  _awaitingNotifications deleteAt (_awaitingNotifications find _id);

  TRACE_2("createTaskLocal - task rejected",_id,_owner);
};

// Delay task creation if parent not present
if (
  (_parentId isNotEqualTo "") &&
  {!(_parentId in GVAR(tasks))}
) exitWith {
  private _awaiting = GVAR(awaitingTasks) getOrDefault [_parentId, []];
  _awaiting pushBack _this;
  GVAR(awaitingTasks) set [_parentId, _awaiting];
  TRACE_2("createTaskLocal - task creation delayed, parent not created",_id,_parentId);
};

// Get parent task
private _parentTask = taskNull;
if (_parentId isNotEqualTo "") then {
  _parentTask = GVAR(tasks) get _parentId;
};

_title = _title call EFUNC(common,localize);
_description = _description call EFUNC(common,localize);

// Create task
private _task = player createSimpleTask [_title, _parentTask];
_task setSimpleTaskDescription [_description, _title, _title];
_task setSimpleTaskType _type;

if (_pos isNotEqualTo []) then {
  _task setSimpleTaskDestination _pos;
};

private _stateClass = _state call FUNC(getTaskStateClass);
_task setTaskState _stateClass;

GVAR(tasks) set [_id, _task];

// Show awaiting notification if present
private _awaitingNotifications = GVAR(awaitingNotifications);
if (_id in _awaitingNotifications) then {
  _awaitingNotifications deleteAt (_awaitingNotifications find _id);
  [_id, _state] call FUNC(showTaskNotificationLocal);
  TRACE_2("Showing awaiting notification",_id,_state);
};

// Create awaiting tasks
if (_id in GVAR(awaitingTasks)) then {
  private _tasks = GVAR(awaitingTasks) get _id;
  TRACE_2("createTaskLocal - creating awaiting tasks",_id,_tasks);
  GVAR(awaitingTasks) deleteAt _id;

  {
    _x call FUNC(createTaskLocal);
  } forEach _tasks;
};
