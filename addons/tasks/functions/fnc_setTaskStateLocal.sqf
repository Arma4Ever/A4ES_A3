#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets task state on client
 */

params ["_id", "_state"];
TRACE_2("setTaskStateLocal",_id,_state);

if !(hasInterface) exitWith {};

private _tasks = GVAR(tasks);

if !(_id in _tasks) exitWith {
  TRACE_1("setTaskStateLocal - skipping setting task state, task not created",_id);
};

private _task = _tasks get _id;
private _stateClass = _state call FUNC(getTaskStateClass);
_task setTaskState _stateClass;
