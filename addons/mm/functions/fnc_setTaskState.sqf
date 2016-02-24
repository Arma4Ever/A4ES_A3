/*
 * Author: SzwedzikPL
 * Set task state on client
 */
#include "script_component.hpp"

params ["_taskID", "_taskState", "_showNotification", "_serverTime"];

private _missionTasks = missionNamespace getVariable [QGVAR(missionTasks), []];
private _missionTasksData = missionNamespace getVariable [QGVAR(missionTasksData), []];
if(_taskID in _missionTasks) then {

    private _taskData = (_missionTasksData select (_missionTasks find _taskID));
    _taskData params ["_task", "_taskTitle"];
    _task setTaskState _taskState;

    if(_showNotification && (servertime - _serverTime < 5)) then {
        [format ["task%1", _taskState], ["", _taskTitle]] call bis_fnc_shownotification;
    };
};
