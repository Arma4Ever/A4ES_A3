/*
 * Author: SzwedzikPL
 * Cache PFH for modules (AI generators)
 */
#include "script_component.hpp"

//BEGIN_COUNTER(cacheModulesHandler);

if (!isServer) exitWith {};

{
    private _module = _x;
    private _moduleSize = _module getVariable ["logicSize", 0];
    private _isVisibleForPlayers = false;
    private _playableUnits = [[player], playableUnits] select isMultiplayer;
    {
        private _player = vehicle _x;
        private _distance = ((_module distance _player) - _moduleSize) max 0;
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

    if (_isVisibleForPlayers && {(_module in GVAR(cacheModules))}) then {
        //exec module
        GVAR(cacheModules) deleteAt (GVAR(cacheModules) find _module);
        private _function = getText (configFile >> "CfgVehicles" >> (typeof _module) >> "function");
        ["init",[_module,true,false]] spawn (missionNamespace getVariable [_function, {}]);
    };
} forEach +GVAR(cacheModules);

//END_COUNTER(cacheModulesHandler);
