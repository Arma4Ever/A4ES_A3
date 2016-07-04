/*
 * Author: SzwedzikPL
 * Cache PFH for groups (AI)
 */
#include "script_component.hpp"

//BEGIN_COUNTER(cacheGroupHandler);

if (!isServer) exitWith {};

private _group = GVAR(cacheGroups) select GVAR(cacheGroupIndex);

if (({alive _x} count (units _group)) > 0) then {
    private _leader = vehicle (leader _group);
    private _isVisibleForPlayers = false;
    {
        private _player = vehicle _x;
        private _distance = _leader distance _player;
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
    } forEach ([[player], playableUnits] select isMultiplayer);

    if (!_isVisibleForPlayers && {!(_group in GVAR(cachedGroups))}) then {
        //cache group
        GVAR(cachedGroups) pushback _group;
        _group call FUNC(cacheGroup);
    };
    if (_isVisibleForPlayers && {(_group in GVAR(cachedGroups))}) then {
        //uncahe group
        GVAR(cachedGroups) deleteAt (GVAR(cachedGroups) find _group);
        _group call FUNC(uncacheGroup);
    };
} else {
    //no alive units in group, clean data
    GVAR(cacheGroups) deleteAt (GVAR(cacheGroups) find _group);
    if (!isMultiplayer) then {systemchat "Cache - Usuwam pusta grupe AI";};
    [_group] remoteExecCall [QFUNC(deleteGroup), groupOwner _group];
};

GVAR(cacheGroupIndex) = GVAR(cacheGroupIndex) + 1;
if (GVAR(cacheGroupIndex) >= (count GVAR(cacheGroups))) then {GVAR(cacheGroupIndex) = 0;};

//END_COUNTER(cacheGroupHandler);
