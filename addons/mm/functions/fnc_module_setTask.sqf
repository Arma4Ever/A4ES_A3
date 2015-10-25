/*
	Autor: SzwedzikPL
	Opis: Tworzy nowe zdanie (server)
*/
#include "script_component.hpp"

if(!isServer) exitWith {};

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if (!_activated) exitWith {};

_taskID = _logic getVariable ["taskID", ""];
_taskTitle = _logic getVariable ["taskTitle", ""];
_taskDescription = _logic getVariable ["taskDescription", ""];
_taskTarget = call compile (_logic getVariable ["taskTarget", ""]);
_taskNotification = _logic getVariable ["taskNotification", false];
_taskLabel = _logic getVariable ["taskLabel", ""];
_taskPosition = _logic getVariable ["taskPosition", ""];
_taskParent = _logic getVariable ["taskParent", ""];

if(_taskPosition != "") then {_taskPosition = call compile _taskPosition;};

if(_taskID == "") exitWith {["Niepoprawne ID zadania"] call bis_fnc_error;};

_missionTasks = missionNamespace getVariable ["a3c_fnc_tasks",[]];
if(!(_taskID in _missionTasks)) then {

	//--- Save task ID
	_missionTasks pushBack _taskID;
	missionNamespace setVariable ["a3c_fnc_tasks", _missionTasks];

	//--- Save task data
	_taskData = [_taskID,_taskTitle,_taskDescription, _taskTarget, _taskNotification, _taskLabel, _taskPosition, "Created"];
	_taskVar = format ["a3c_fnc_task_%1", _taskID];
	missionNamespace setVariable [_taskVar, _taskData];
	publicvariable _taskVar;

	//--- Save task dependencies
	if(_taskParent != "") then {
		_missionTasksRelations = missionNamespace getVariable ["a3c_fnc_tasks_rel",[]];
		_missionTasksRelations pushBack [_taskParent,_taskID];
		missionNamespace setVariable ["a3c_fnc_tasks_rel", _missionTasksRelations];
	} else {
		//--- Set task globally
		[
			[_taskID, servertime],
			QFUNC(setTaskLocal),
			_taskTarget,
			true,
			true
		] call BIS_fnc_MP;
	};
};
