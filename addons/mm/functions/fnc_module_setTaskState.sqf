/*
	Autor: SzwedzikPL
	Opis: Ustawia status zadania (server)
*/
#include "script_component.hpp"

if(!isServer) exitWith {};

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if (!_activated) exitWith {};

_taskID = _logic getVariable ["taskID", ""];
_taskStatus = _logic getVariable ["taskStatus", ""];
_taskNotification = _logic getVariable ["taskNotification", false];

_availableStatuses = ["created", "assigned", "succeeded", "failed", "canceled"];

if(_taskID == "") exitWith {["Niepoprawne ID zadania"] call bis_fnc_error;};
if(!((tolower _taskStatus) in _availableStatuses)) exitWith {["Niepoprawny status zadania"] call bis_fnc_error;};

_missionTasks = missionNamespace getVariable ["a3c_fnc_tasks",[]];

if(_taskID in _missionTasks) then {

	_taskVar = format ["a3c_fnc_task_%1", _taskID];
	_taskData = missionNamespace getVariable [_taskVar,[]];
	_taskTarget = [_taskData, 3, [], [[],west]] call BIS_fnc_param;
	_taskStatusOld  = [_taskData, 7, "", [""]] call BIS_fnc_param;

	//--- If new status is different than actual status
	if((tolower _taskStatus) != (tolower _taskStatusOld)) then {

		//--- Save new task status
		_taskData set [7,_taskStatus];
		missionNamespace setVariable [_taskVar, _taskData];
		publicvariable _taskVar;

		[
			[_taskID, servertime],
			QFUNC(setTaskStateLocal),
			_taskTarget,
			true,
			true
		] call BIS_fnc_MP;

		//--- Create child tasks if succeeded or canceled
		if((tolower _taskStatus) == "succeeded" || (tolower _taskStatus) == "canceled") then {

			//--- Check if task have child tasks
			_missionTasksRelations = missionNamespace getVariable ["a3c_fnc_tasks_rel",[]];
			_childTasks = [];
			{if(_taskID == (_x select 0)) then {_childTasks pushBack (_x select 1);};} forEach _missionTasksRelations;

			if(count _childTasks > 0) then {
				{
					_childTaskID = _x;
					_childTaskVar = format ["a3c_fnc_task_%1", _childTaskID];
					_childTaskData = missionNamespace getVariable [_childTaskVar,[]];
					_childTaskTarget = [_childTaskData, 3, [], [[],west]] call BIS_fnc_param;

					//--- Set child task globally
					[
						[_childTaskID, servertime],
						QFUNC(setTaskLocal),
						_childTaskTarget,
						true,
						true
					] call BIS_fnc_MP;
				} foreach _childTasks;
			};
		};

	};
};
