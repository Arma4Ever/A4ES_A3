/*
	Autor: SzwedzikPL
	Opis: Ustawia status zadania
*/
#include "script_component.hpp"

if(isDedicated) exitWith {};

_taskID = [_this, 0, "", [""]] call BIS_fnc_param;
_taskCreateTime = [_this, 1, 0, [0]] call BIS_fnc_param;

_taskVar = format ["a3c_fnc_task_%1", _taskID];
_taskData = missionNamespace getVariable [_taskVar,[]];

_taskTitle = [_taskData, 1, "", [""]] call BIS_fnc_param;
_taskNotification = [_taskData, 4, true, [true]] call BIS_fnc_param;
_taskStatus  = [_taskData, 7, "", [""]] call BIS_fnc_param;

_missionTasks = missionNamespace getVariable ["a3c_fnc_tasksLocal",[]];

if(_taskID in _missionTasks) then {

	//--- Get task "object"
	_taskLocalVar = format ["a3c_fnc_tasklocal_%1", _taskID];
	_task = missionNamespace getVariable [_taskLocalVar, taskNull];

	//--- Set task status
	_task setTaskState _taskStatus;

	//--- Show notification if not JIP
	if(_taskNotification && (servertime - _taskCreateTime < 5)) then {
		[("task"+_taskStatus),["",_taskTitle]] call bis_fnc_shownotification;
	};
};
