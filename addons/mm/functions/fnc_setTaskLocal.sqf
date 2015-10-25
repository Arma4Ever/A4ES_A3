/*
	Autor: SzwedzikPL
	Opis: Tworzy nowe zadanie
*/
#include "script_component.hpp"

if(isDedicated) exitWith {};

_taskID = [_this, 0, "", [""]] call BIS_fnc_param;
_taskCreateTime = [_this, 1, 0, [0]] call BIS_fnc_param;

_taskVar = format ["a3c_fnc_task_%1", _taskID];
_taskData = missionNamespace getVariable [_taskVar,[]];

_taskTitle = [_taskData, 1, "", [""]] call BIS_fnc_param;
_taskDescription = [_taskData, 2, "", [""]] call BIS_fnc_param;
_taskTarget = [_taskData, 3, [], [[],west]] call BIS_fnc_param;
_taskNotification = [_taskData, 4, true, [true]] call BIS_fnc_param;
_taskLabel = [_taskData, 5, "", [""]] call BIS_fnc_param;
_taskPosition = [_taskData, 6, [], [[],""]] call BIS_fnc_param;
_taskStatus  = [_taskData, 7, "", [""]] call BIS_fnc_param;

_missionTasks = missionNamespace getVariable ["a3c_fnc_tasksLocal",[]];

if(!(_taskID in _missionTasks)) then {
	_missionTasks pushBack _taskID;
	missionNamespace setVariable ["a3c_fnc_tasksLocal", _missionTasks];

	//--- Create task with given data
	_task = player createSimpleTask [_taskTitle];
	_task setSimpleTaskDescription [
	   _taskDescription,
	   _taskTitle,
	   _taskLabel
	];

	//--- If taskPosition is marker get marker position
	if(typename _taskPosition == "STRING") then {
		_taskPosition = getMarkerPos _taskPosition;
	};

	//--- Set task position
	if(count _taskPosition == 3) then {
		_task setSimpleTaskDestination _taskPosition;
	};

	_task setTaskState "CREATED";

	//--- Save task "object"
	_taskLocalVar = format ["a3c_fnc_tasklocal_%1", _taskID];
	missionNamespace setVariable [_taskLocalVar, _task];

	//--- Show notification if not JIP
	if(_taskNotification && (servertime - _taskCreateTime < 5)) then {
		["taskCreated", ["",_taskTitle]] call bis_fnc_shownotification;
	};
};
