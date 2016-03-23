/*
 * Author: SzwedzikPL
 * cacheSettings module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("cacheSettings: blokuje wykonanie modulu");true};

    GVAR(cacheEnabled) = (_logic getVariable ["enable", 1]) > 0;
    GVAR(cacheDistanceLand) = _logic getVariable ["distanceLand", 2500];
    GVAR(cacheDistanceHelicopters) = _logic getVariable ["distanceHelicopter", 2500];;
    GVAR(cacheDistancePlanes) = _logic getVariable ["distancePlane", 2500];

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
