/*
 * Author: SzwedzikPL
 * setTaskState module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("setTaskState: blokuje wykonanie modulu");true};

    private _taskID = _logic getVariable ["taskID", ""];
    private _taskState = _logic getVariable ["taskState", ""];
    private _showNotification = (_logic getVariable ["showNotification", 0]) > 0;

    if(_taskID == "") exitWith {true};

    private _missionTasks = missionNamespace getVariable [QGVAR(missionTasks), []];
    private _missionTaskStates = missionNamespace getVariable [QGVAR(missionTaskStates), []];
    private _missionTaskTargets = missionNamespace getVariable [QGVAR(missionTaskTargets), []];
    if(_taskID in _missionTasks) then {
        private _taskIndex = _missionTasks find _taskID;
        private _taskTarget = (_missionTaskTargets select _taskIndex);

        _missionTaskStates set [_taskIndex, _taskState];
        missionNamespace setVariable [QGVAR(missionTaskStates), _missionTaskStates];

        [_taskID, _taskState, _showNotification, serverTime] remoteExecCall [QFUNC(setTaskState), _taskTarget, true];
    };
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
