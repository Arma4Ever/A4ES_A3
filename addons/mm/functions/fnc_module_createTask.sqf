/*
 * Author: SzwedzikPL
 * createTask module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("createTask: blokuje wykonanie modulu");true};

    private _taskID = _logic getVariable ["taskID", ""];
    private _taskTitle = _logic getVariable ["taskTitle", ""];
    private _taskDesc = _logic getVariable ["taskDesc", ""];
    private _taskTarget = call compile (_logic getVariable ["taskTarget", ""]);
    private _showNotification = (_logic getVariable ["showNotification", 0]) > 0;

    if(_taskID == "") exitWith {true};

    private _missionTasks = missionNamespace getVariable [QGVAR(missionTasks), []];
    private _missionTaskStates = missionNamespace getVariable [QGVAR(missionTaskStates), []];
    private _missionTaskTargets = missionNamespace getVariable [QGVAR(missionTaskTargets), []];
    if(!(_taskID in _missionTasks)) then {
        [_taskID, _taskTitle, _taskDesc, _showNotification, serverTime] remoteExecCall [QFUNC(createTask), _taskTarget, true];

        _missionTasks pushBack _taskID;
        _missionTaskStates pushBack "CREATED";
        _missionTaskTargets pushBack _taskTarget;
        missionNamespace setVariable [QGVAR(missionTasks), _missionTasks];
        missionNamespace setVariable [QGVAR(missionTaskStates), _missionTaskStates];
        missionNamespace setVariable [QGVAR(missionTaskTargets), _missionTaskTargets];
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
