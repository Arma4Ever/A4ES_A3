#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets task state globally (and jip)
 */

params ["_id", "_state", "_showNotification"];
TRACE_3("setTaskState",_id,_state,_showNotification);

// Ignore setting state of not created tasks
if !(_id in GVAR(createdTasks)) exitWith {
  TRACE_1("setTaskState - skipping setting task state, task not created",_id);
};

// Set task state globally & jip
// Use _id as jip id to save only last state update
[QGVAR(setTaskState), [_id, _state], _id] call CBA_fnc_globalEventJIP;

// Send notification if not mission start
if (_showNotification) then {
  [_id, _state] call FUNC(showTaskNotification);
};
