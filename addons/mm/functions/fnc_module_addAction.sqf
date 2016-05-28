/*
 * Author: SzwedzikPL
 * addAction module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("addAction: blokuje wykonanie modulu");true};

    private _actionObject = call compile (_logic getVariable ["actionObject", ""]);
    private _actionName = _logic getVariable ["actionName", ""];
    private _actionCodeLocal = compile (_logic getVariable ["actionCodeLocal", ""]);
    private _actionCodeGlobal = compile (_logic getVariable ["actionCodeGlobal", ""]);
    private _actionCondition = compile (_logic getVariable ["actionCondition", ""]);
    private _actionTarget = _logic call compile (_logic getVariable ["actionTarget", "0"]);
    private _actionDisposable = (_logic getVariable ["actionDisposable", 0]) > 0;

    GVAR(moduleAddActionID) = GVAR(moduleAddActionID) + 1;
    private _actionID = format ["moduleAddAction_Act_%1", GVAR(moduleAddActionID)];

    private _actionAction = [
        _actionID,
        _actionName,
        "",
        {_this call FUNC(addActionExec)},
        _actionCondition,
        {},
        [_actionID, _actionCodeLocal, _actionCodeGlobal, _actionTarget, _actionDisposable]
    ] call ace_interact_menu_fnc_createAction;

    [_actionObject, _actionAction] remoteExecCall [QFUNC(addActionGlobal), _actionTarget, true];
};
// EDEN - When some attributes were changed (including position and rotation)
if (_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if (_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if (_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if (_mode == "connectionChanged3DEN") then {};

true
