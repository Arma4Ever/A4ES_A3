/*
 * Author: SzwedzikPL
 * genMinefield module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genMinefield: blokuje wykonanie modulu");true};

    //Load module params
    private _logicAreaParams = _logic getvariable "objectArea";
    private _mineClasses = call compile (_logic getvariable ["classes", ""]);
    private _mineCount = _logic getvariable ["mineCount", 0];

    //Calc size of logic
    _logicAreaParams params ["_logicSizeX","_logicSizeY", "_logicAngle", "_logicIsRectangle"];
    private _logicArea = [_logic, _logicSizeX, _logicSizeY, _logicAngle, _logicIsRectangle];
    private _logicSize = _logicSizeX max _logicSizeY;

    if (!isMultiplayer) then {systemchat format ["genMinefield - Generuje %1 min", _mineCount];};

    //Spawn mines
    for "_spawnCounter" from 1 to _mineCount do {
        private _minePosition = [0,0,0];
        private _goodPosition = false;
        while {!_goodPosition} do {
            _goodPosition = true;
            _minePosition = _logic getPos [random _logicSize, random 360];
            if (!(_minePosition inArea _logicArea)) then {_goodPosition = false;};
        };

        private _mineClass = selectRandom _mineClasses;
        private _mineDir = random 360;
        private _mine = createMine [_mineClass, _minePosition, [], 0];
        _mine setDir _mineDir;

        if (!isMultiplayer) then {
            private _marker = createMarkerLocal [str _mine, _minePosition];
            _marker setMarkerTypeLocal "mil_triangle";
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerSizeLocal [1, 1];
            _marker setMarkerDirLocal _mineDir;
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
