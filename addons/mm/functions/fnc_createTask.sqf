/*
 * Author: SzwedzikPL
 * Create task on client
 */
#include "script_component.hpp"

params ["_taskID", "_taskTitle", "_taskDesc", "_showNotification", "_taskPosition", "_serverTime"];

private _missionTasks = missionNamespace getVariable [QGVAR(missionTasks), []];
private _missionTaskStates = missionNamespace getVariable [QGVAR(missionTaskStates), []];
private _missionTasksData = missionNamespace getVariable [QGVAR(missionTasksData), []];
if (!(_taskID in _missionTasks)) then {
    private _task = player createSimpleTask [_taskTitle];

    //support for SP
    if (!isServer) then {
        _missionTasks pushBack _taskID;
        _missionTaskStates pushBack "CREATED";

        missionNamespace setVariable [QGVAR(missionTasks), _missionTasks];
        missionNamespace setVariable [QGVAR(missionTaskStates), _missionTaskStates];
    };

    _missionTasksData pushback [_task, _taskTitle];
    missionNamespace setVariable [QGVAR(missionTasksData), _missionTasksData];

    _task setSimpleTaskDescription [_taskDesc, _taskTitle, ""];
    _task setSimpleTaskDestination _taskPosition;
    _task setTaskState "CREATED";

    if (_showNotification && (serverTime - _serverTime < 5)) then {
        ["taskCreated", ["", _taskTitle]] call bis_fnc_shownotification;
    };
};
