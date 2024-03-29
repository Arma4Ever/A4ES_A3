#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets task state globally (and jip)
 */

params ["_id", "_state", "_showNotification"];
TRACE_3("setTaskState",_id,_state,_showNotification);

private _createdTasks = GVAR(createdTasks);

if !(isServer) exitWith {false};

// Ignore setting state of not created tasks
if !(_id in _createdTasks) exitWith {
  TRACE_1("setTaskState - skipping setting task state, task not created",_id);
  GVAR(awaitingTasksStatesServer) set [_id, _state];
  false
};

private _currentState = _createdTasks get _id;
if (_currentState isEqualTo _state) exitWith {
  TRACE_2("setTaskState - skipping setting task state, task state not changed",_id,_state);
  false
};

// Log change
["a4es_taskStateChanged", [_id, _state call FUNC(getTaskStateClass)]] call CBA_fnc_serverEvent;

// Update task state info
_createdTasks set [_id, _state];

// Set task state globally & jip
// Use _id as jip id to save only last state update
[QGVAR(setTaskState), [_id, _state], _id] call CBA_fnc_globalEventJIP;

// Send notification if not mission start
if (_showNotification) then {
  [_id, _state] call FUNC(showTaskNotification);
};

true
