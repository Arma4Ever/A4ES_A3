#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows task notification on client
 */

params ["_id", "_state"];
TRACE_2("showTaskNotificationLocal",_id,_state);

if !(hasInterface) exitWith {};

// Do not show notifications for not created tasks
if !(_id in GVAR(tasks)) exitWith {
  // Do not save notification if task has been rejected
  if (_id in GVAR(rejectedTasks)) exitWith {};
  // Save info about awaiting notification
  GVAR(awaitingNotifications) pushBackUnique _id;
  TRACE_1("showTaskNotificationLocal - adding notification to awaiting",_id);
};

private _notificationClass = ([
  "TaskCreated",
  "TaskAssigned",
  "TaskSucceeded",
  "TaskFailed",
  "TaskCanceled"
] param [_state, ""]);

if (_notificationClass isEqualTo "") exitWith {};

private _task = GVAR(tasks) get _id;
private _taskDesc = taskDescription _task;

TRACE_2("showTaskNotificationLocal - showing notification",_notificationClass,_taskDesc);
[_notificationClass, ["", _taskDesc # 1]] call BIS_fnc_showNotification;
