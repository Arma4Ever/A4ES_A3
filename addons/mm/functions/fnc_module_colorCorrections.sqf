/*
 * Author: SzwedzikPL
 * colorCorrections module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("colorCorrections: blokuje wykonanie modulu")true};

    private _effectType = _logic getVariable ["effecttype", "dayzsa"];
    private _enableInEden = (_logic getVariable ["enableInEden", 0]) > 0;

    if(is3DEN) then {
        if(!_enableInEden) exitWith {true};
        _effectType call DFUNC(setColorCorrection);
    } else {
        _effectType remoteExecCall [QFUNC(setColorCorrection), 0, true];

        //Set as disposable if possible
        _logic call FUNC(setDisposable);
    };
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {
    _input params [["_logic", objNull, [objNull]]];
    private _effectType = _logic getVariable ["effecttype", "dayzsa"];
    private _enableInEden = (_logic getVariable ["enableInEden", 0]) > 0;
    ppEffectDestroy (missionNamespace getVariable [QGVAR(colorCorrectionsEffect), -1]);
    if(!_enableInEden) exitWith {true};
    _effectType call DFUNC(setColorCorrection);
};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {
    _input params [["_logic", objNull, [objNull]]];
    private _effectType = _logic getVariable ["effecttype", "dayzsa"];
    private _enableInEden = (_logic getVariable ["enableInEden", 0]) > 0;
    ppEffectDestroy (missionNamespace getVariable [QGVAR(colorCorrectionsEffect), -1]);
    if(!_enableInEden) exitWith {true};
    _effectType call DFUNC(setColorCorrection);
};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {
    ppEffectDestroy (missionNamespace getVariable [QGVAR(colorCorrectionsEffect), -1]);
};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
