#include "script_component.hpp"

if(!isServer) exitWith {};
if(GVAR(enabled)) exitWith {};

GVAR(enabled) = true;
GVAR(cachedGroups) = [];
GVAR(allGroups) = [];

{
    private ["_group", "_players"];
    _group = _x;
    _players = {isPlayer _x} count (units _group);
    _unitsInVehicles = {vehicle _x != _x} count (units _group);
    if(_players == 0 && {_unitsInVehicles == 0} && {!(_group in GVAR(allGroups))}) then {
        GVAR(allGroups) pushBack _group;
    };
} foreach allGroups;

//first run & loop
0 call FUNC(checkGroupCache);
[FUNC(checkGroupCache), 20, []] call CBA_fnc_addPerFrameHandler;
