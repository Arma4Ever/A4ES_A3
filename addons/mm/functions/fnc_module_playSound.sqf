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
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("playSound: blokuje wykonanie modulu")true};

    private _sourcePos = markerpos (_logic getVariable ["place", ""]);
    private _soundArray = call compile (_logic getVariable ["sound", ""]);
    private _soundPath = _logic getVariable ["soundPath", ""];
    private _missionPath = (_logic getVariable ["missionPath", 0]) > 0;
    private _soundDurationOwn = _logic getVariable ["soundDuration", 0];
    private _volume = _logic getVariable ["volume", 0];
    private _distance = _logic getVariable ["distance", 0];
    private _loop = (_logic getVariable ["loop", 0]) > 0;

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

    A3CS_LOGINFO_3("playSound: %1 %2 %3",_soundPath,_soundDuration,_loop)

    playSound3D [_soundPath, objNull, false, _sourcePos, _volume, 1, _distance];

    if(_loop) then {
        _soundDuration = _soundDuration + 0.5;
        [_soundPath, _sourcePos, _volume, _distance, _soundDuration] spawn {
            params ["_soundPath", "_sourcePos", "_volume", "_distance", "_soundDuration"];
            while {true} do {
                sleep _soundDuration;
                playSound3D [_soundPath, objNull, false, _sourcePos, _volume, 1, _distance];
            };
        };
    };

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
