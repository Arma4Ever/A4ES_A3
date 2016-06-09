/*
 * Author: SzwedzikPL
 * playSound module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("playSound: blokuje wykonanie modulu");true};

    private _soundArray = call compile (_logic getVariable ["sound", ""]);
    private _soundPath = _logic getVariable ["soundPath", ""];
    private _missionPath = (_logic getVariable ["missionPath", 0]) > 0;
    private _soundDurationOwn = _logic getVariable ["soundDuration", 0];
    private _volume = _logic getVariable ["volume", 0];
    private _distance = _logic getVariable ["distance", 0];
    private _loop = (_logic getVariable ["loop", 0]) > 0;
    private _loopCondition = compile (_logic getVariable ["loopCondition", "true"]);
    private _playDelay = _logic getVariable ["playDelay", 0];

    _playDelay = _playDelay + 0.001;

    private _sourcePos = getPosASL _logic;
    _soundArray params ["_sound", "_soundDuration"];

    if (_sound == "own") then {
        _soundDuration = _soundDurationOwn;
        if (_missionPath) then {
            private _pathToMissionFile = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
            _soundPath = format ["%1%2", _pathToMissionFile, _soundPath];
        };
    } else {
        _soundPath = [_sound, 1] call BIS_fnc_trimString;
    };

    TRACE_3("module_playSound3D",_soundPath,_soundDuration,_loop);

    _soundDuration = _soundDuration + _playDelay;
    private _soundParams = [_soundPath, objNull, false, _sourcePos, _volume, 1, _distance];

    if (_loop && !(0 call _loopCondition)) exitWith {};

    [DFUNC(playSound3D), [_soundParams, _loop, _loopCondition, _soundDuration], _playDelay] call CBA_fnc_waitAndExecute;

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
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
