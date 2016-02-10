/*
 * Author: SzwedzikPL
 * cacheSettings module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", true, [true]], ["_isCuratorPlaced", false, [true]]];
    if(isNull _logic || !_isActivated) exitWith {};
    if(_isCuratorPlaced) exitWith {};

    GVAR(cacheEnabled) = (_logic getVariable ["enable", 1]) > 0;
    GVAR(cacheDistanceLand) = _logic getVariable ["distanceLand", 2500];
    GVAR(cacheDistanceHelicopters) = _logic getVariable ["distanceHelicopter", 2500];;
    GVAR(cacheDistancePlanes) = _logic getVariable ["distancePlane", 2500];

    //Delete module if disposable
    if(getNumber (configFile >> "CfgVehicles" >> (typeof _logic) >> "disposable") > 0) then {
        deleteVehicle _logic;
    };
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};
