/*
 * Author: SzwedzikPL
 * Set task state on client
 */
#include "script_component.hpp"

params ["_taskID", "_taskState", "_showNotification", "_serverTime"];

private _missionTasks = missionNamespace getVariable [QGVAR(missionTasks), []];
private _missionTaskStates = missionNamespace getVariable [QGVAR(missionTaskStates), []];
private _missionTasksData = missionNamespace getVariable [QGVAR(missionTasksData), []];
if(_taskID in _missionTasks) then {
    private _taskIndex = _missionTasks find _taskID;
    private _taskData = _missionTasksData select _taskIndex;

    _taskData params ["_task", "_taskTitle"];
    _task setTaskState _taskState;

    _missionTaskStates set [_taskIndex, _taskState];
    missionNamespace setVariable [QGVAR(missionTaskStates), _missionTaskStates];

    if(_showNotification && (servertime - _serverTime < 5)) then {
        [format ["task%1", _taskState], ["", _taskTitle]] call bis_fnc_shownotification;
    };
};
