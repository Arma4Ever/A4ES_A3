/*
 * Author: SzwedzikPL
 * Return status of task with given ID. Part of A3CS public API
 */
#include "script_component.hpp"

params [["_taskID", "", [""]]];

private _return = "";

private _missionTasks = missionNamespace getVariable [QEGVAR(mm,missionTasks), []];
private _missionTaskStates = missionNamespace getVariable [QEGVAR(mm,missionTaskStates), []];
if (_taskID in _missionTasks) then {
    private _taskIndex = _missionTasks find _taskID;
    _return = tolower (_missionTaskStates select _taskIndex);
};

_return
