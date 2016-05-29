/*
 * Author: SzwedzikPL
 * genAnimals module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genAnimals: blokuje wykonanie modulu");true};

    //Load module params
    private _logicAreaParams = _logic getvariable "objectArea";
    private _type = _logic getvariable ["type", "Sheep_random_F"];
    private _count = _logic getVariable ["count", 0];
    private _cacheModule = (_logic getVariable ["cacheModule", 1]) > 0;
    private _script = compile (_logic getVariable ["script", ""]);

    //Calc size of logic and save data
    _logicAreaParams params ["_logicSizeX","_logicSizeY", "_logicAngle", "_logicIsRectangle"];
    private _logicArea = [_logic, _logicSizeX, _logicSizeY, _logicAngle, _logicIsRectangle];
    private _logicSize = _logicSizeX max _logicSizeY;
    private _logicSizeMin = _logicSizeX min _logicSizeY;
    _logic setVariable ["logicSize", _logicSize];

    //check distance to nearest player if cache is inited
    private _isVisibleForPlayers = false;
    if (GVAR(cacheInited) && {_cacheModule}) then {
        private _playableUnits = [[player], playableUnits] select isMultiplayer;
        {
            private _player = vehicle _x;
            private _distance = ((_logic distance _player) - _logicSize) max 0;
            if (GVAR(cacheDistanceLand) > 0) then {
                if (_distance < GVAR(cacheDistanceLand) && {_player iskindOf "Land"}) exitWith {_isVisibleForPlayers = true;};
                if (_distance < GVAR(cacheDistanceLand) && {_player iskindOf "Ship"}) exitWith {_isVisibleForPlayers = true;};
            };
            if (GVAR(cacheDistanceHelicopters) > 0) then {
                if (_distance < GVAR(cacheDistanceHelicopters) && {_player iskindOf "Helicopter"}) exitWith {_isVisibleForPlayers = true;};
            };
            if (GVAR(cacheDistancePlanes) > 0) then {
                if (_distance < GVAR(cacheDistancePlanes) && {_player iskindOf "Plane"}) exitWith {_isVisibleForPlayers = true;};
            };
        } forEach _playableUnits;
    };

    if (!_isVisibleForPlayers && {_cacheModule}) exitWith {GVAR(cacheModules) pushBack _logic;};

    private _aliveAnimals = [];

    //SP debug log
    if (!isMultiplayer) then {systemchat format ["genAnimals - Generuje %1 zwierzat", _count];};

    //Start respawn
    private _spawnCounter = 0;
    for "_spawnCounter" from 1 to _count do {
        private _animalPosition = [];
        private _goodPosition = false;
        while {!_goodPosition} do {
            _goodPosition = true;
            _animalPosition = _logic getPos [random _logicSize, random 360];
            if (!(_animalPosition inArea _logicArea)) then {_goodPosition = false;};
        };

        _animal = createAgent [_type, _animalPosition, [], 1, "NONE"];
        _animal setDir (random 360);
        _animal setVariable ["a3cs_generated", true, true];
        _animal setVariable [QGVAR(genAnimals), true, true];
        _aliveAnimals pushback _animal;
    };

    //Spawn custom script
    if (!isNil "_script") then {
        {_x spawn _script;} forEach _aliveAnimals;
    };

    //Start debug if SP/Editor
    if (!isMultiplayer) then {
        _aliveAnimals spawn {
            private _aliveAnimals = _this;
            private _allMarkers = [];
            while {({alive _x} count _aliveAnimals) > 0} do {
                _allMarkers = [];
                {
                    private _animal = _x;
                    if (alive _animal) then {
                        private _marker = createMarkerLocal [str _animal, position _animal];
                        _marker setMarkerTypeLocal "mil_triangle";
                        _marker setMarkerColorLocal "ColorBrown";
                        _marker setMarkerSizeLocal [1, 1];
                        _marker setMarkerDirLocal (getDir _animal);
                        _allMarkers pushBack _marker;
                    } else {
                        _aliveAnimals deleteAt (_aliveAnimals find _animal);
                    };
                } forEach +_aliveAnimals;
                sleep 0.1;
                {deleteMarkerLocal _x;} forEach _allMarkers;
            };
        };
    };

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
