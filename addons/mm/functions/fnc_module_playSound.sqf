/*
 * Author: SzwedzikPL
 * playSound module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("playSound: blokuje wykonanie modulu");true};

    private _source = _logic getVariable ["place", ""];
    private _soundArray = call compile (_logic getVariable ["sound", ""]);
    private _soundPath = _logic getVariable ["soundPath", ""];
    private _missionPath = (_logic getVariable ["missionPath", 0]) > 0;
    private _soundDurationOwn = _logic getVariable ["soundDuration", 0];
    private _volume = _logic getVariable ["volume", 0];
    private _distance = _logic getVariable ["distance", 0];
    private _loop = (_logic getVariable ["loop", 0]) > 0;

    private _sourcePos = [0,0,0];

    if(isNil {(call compile _source)}) then {
        _sourcePos = markerPos _source;
    } else {
        private _sourceResult = call compile _source;
        if(_sourceResult isEqualTypeAny [[], objNull]) then {
            if(_sourceResult isEqualType objNull) then {
                _sourcePos = getPosASL _sourceResult;
            };
            if(_sourceResult isEqualType []) then {
                _sourcePos = _sourceResult;
            };
        } else {
            "Podano niepoprawne zrodlo dzwieku" call BIS_fnc_error;
        };
    };

    _soundArray params ["_sound", "_soundDuration"];

    if(_sound == "own") then {
        _soundDuration = _soundDurationOwn;
        if(_missionPath) then {
            private _pathToMissionFile = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
            _soundPath = format ["%1%2", _pathToMissionFile, _soundPath];
        };
    } else {
        _soundPath = [_sound, 1] call BIS_fnc_trimString;
    };

    TRACE_3("module_playSound3D",_soundPath,_soundDuration,_loop);

    _soundDuration = _soundDuration + 0.5;
    private _soundParams = [_soundPath, objNull, false, _sourcePos, _volume, 1, _distance];

    [_soundParams, _loop, _soundDuration] call FUNC(playSound3D);

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
