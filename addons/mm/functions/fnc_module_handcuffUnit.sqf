/*
 * Author: SzwedzikPL
 * handcuffUnit module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("handcuffUnit: blokuje wykonanie modulu");true};

    private _units = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};

    [{
        params ["_units", "_setHandcuffed"];
        {["SetHandcuffed", [_x], [_x, _setHandcuffed]] call ace_common_fnc_targetEvent;} forEach _units;
    }, [_units, true]] call ace_common_fnc_runAfterSettingsInit;

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
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
