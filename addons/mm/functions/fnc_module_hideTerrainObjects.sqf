/*
 * Author: SzwedzikPL
 * hideTerrainObjects module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode in ["init", "attributesChanged3DEN", "registeredToWorld3DEN"]) then {
    _input params [["_logic", objNull, [objNull]]];
    if(isNull _logic) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("hideTerrainObjects: blokuje wykonanie modulu")true};

    private _distance = _logic getVariable ["distance", 0];
    private _objectTypes = [];

    if((_logic getVariable ["tree", 1]) > 0) then {_objectTypes pushBack "TREE";};
    if((_logic getVariable ["smalltree", 1]) > 0) then {_objectTypes pushBack "SMALL TREE";};
    if((_logic getVariable ["bush", 1]) > 0) then {_objectTypes pushBack "BUSH";};
    if((_logic getVariable ["building", 1]) > 0) then {_objectTypes pushBack "BUILDING";};
    if((_logic getVariable ["house", 1]) > 0) then {_objectTypes pushBack "HOUSE";};
    if((_logic getVariable ["forestborder", 1]) > 0) then {_objectTypes pushBack "FOREST BORDER";};
    if((_logic getVariable ["foresttriangle", 1]) > 0) then {_objectTypes pushBack "FOREST TRIANGLE";};
    if((_logic getVariable ["forestsquare", 1]) > 0) then {_objectTypes pushBack "FOREST SQUARE";};
    if((_logic getVariable ["church", 1]) > 0) then {_objectTypes pushBack "CHURCH";};
    if((_logic getVariable ["chapel", 1]) > 0) then {_objectTypes pushBack "CHAPEL";};
    if((_logic getVariable ["cross", 1]) > 0) then {_objectTypes pushBack "CROSS";};
    if((_logic getVariable ["rock", 1]) > 0) then {_objectTypes pushBack "ROCK";};
    if((_logic getVariable ["bunker", 1]) > 0) then {_objectTypes pushBack "BUNKER";};
    if((_logic getVariable ["fortress", 1]) > 0) then {_objectTypes pushBack "FORTRESS";};
    if((_logic getVariable ["fountain", 1]) > 0) then {_objectTypes pushBack "FOUNTAIN";};
    if((_logic getVariable ["viewtower", 1]) > 0) then {_objectTypes pushBack "VIEW-TOWER";};
    if((_logic getVariable ["lighthouse", 1]) > 0) then {_objectTypes pushBack "LIGHTHOUSE";};
    if((_logic getVariable ["quay", 1]) > 0) then {_objectTypes pushBack "QUAY";};
    if((_logic getVariable ["fuelstation", 1]) > 0) then {_objectTypes pushBack "FUELSTATION";};
    if((_logic getVariable ["hospital", 1]) > 0) then {_objectTypes pushBack "HOSPITAL";};
    if((_logic getVariable ["fence", 1]) > 0) then {_objectTypes pushBack "FENCE";};
    if((_logic getVariable ["wall", 1]) > 0) then {_objectTypes pushBack "WALL";};
    if((_logic getVariable ["hide", 1]) > 0) then {_objectTypes pushBack "HIDE";};
    if((_logic getVariable ["busstop", 1]) > 0) then {_objectTypes pushBack "BUSSTOP";};
    if((_logic getVariable ["road", 1]) > 0) then {_objectTypes pushBack "ROAD";};
    if((_logic getVariable ["forest", 1]) > 0) then {_objectTypes pushBack "FOREST";};
    if((_logic getVariable ["transmitter", 1]) > 0) then {_objectTypes pushBack "TRANSMITTER";};
    if((_logic getVariable ["stack", 1]) > 0) then {_objectTypes pushBack "STACK";};
    if((_logic getVariable ["ruin", 1]) > 0) then {_objectTypes pushBack "RUIN";};
    if((_logic getVariable ["tourism", 1]) > 0) then {_objectTypes pushBack "TOURISM";};
    if((_logic getVariable ["watertower", 1]) > 0) then {_objectTypes pushBack "WATERTOWER";};
    if((_logic getVariable ["track", 1]) > 0) then {_objectTypes pushBack "TRACK";};
    if((_logic getVariable ["mainroad", 1]) > 0) then {_objectTypes pushBack "MAIN ROAD";};
    if((_logic getVariable ["rocks", 1]) > 0) then {_objectTypes pushBack "ROCKS";};
    if((_logic getVariable ["powerlines", 1]) > 0) then {_objectTypes pushBack "POWER LINES";};
    if((_logic getVariable ["railway", 1]) > 0) then {_objectTypes pushBack "RAILWAY";};
    if((_logic getVariable ["powersolar", 1]) > 0) then {_objectTypes pushBack "POWERSOLAR";};
    if((_logic getVariable ["powerwave", 1]) > 0) then {_objectTypes pushBack "POWERWAVE";};
    if((_logic getVariable ["powerwind", 1]) > 0) then {_objectTypes pushBack "POWERWIND";};
    if((_logic getVariable ["shipwreck", 1]) > 0) then {_objectTypes pushBack "SHIPWRECK";};
    if((_logic getVariable ["trail", 1]) > 0) then {_objectTypes pushBack "TRAIL";};

    {_x hideObjectGlobal false;} forEach GVAR(hiddenTerrainObjects);

    private _objects = nearestTerrainObjects [position _logic, _objectTypes, _distance];
    {_x hideObjectGlobal true;} forEach _objects;
    GVAR(hiddenTerrainObjects) = _objects;

    if(!is3DEN) then {
        //Set as disposable if possible
        _logic call FUNC(setDisposable);
    };
};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {
    {_x hideObjectGlobal false;} forEach GVAR(hiddenTerrainObjects);
};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
