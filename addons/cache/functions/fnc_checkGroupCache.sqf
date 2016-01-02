#include "script_component.hpp"

if(!isServer) exitWith {};

{
    private ["_group", "_leader", "_visibleForPlayers"];
    _group = _x;
    _leader = leader _group;
    _visibleForPlayers = [_leader, GVAR(minDistance)] call CBA_fnc_nearPlayer;

    if(!_visibleForPlayers && {!(_group in GVAR(cachedGroups))}) then {
        //cache group
        GVAR(cachedGroups) pushBack _group;

        private "_groupUnits";
        _groupUnits = units _group;
        _groupUnits deleteAt (_groupUnits find _leader);
        {[_x] call FUNC(cacheUnit);} foreach _groupUnits;
    };
    if(_visibleForPlayers && {_group in GVAR(cachedGroups)} && {vehicle _leader == _leader}) then {
        //uncache group
        GVAR(cachedGroups) deleteAt (GVAR(cachedGroups) find _group);

        private "_groupUnits";
        _groupUnits = units _group;
        _groupUnits deleteAt (_groupUnits find _leader);
        {[_x, _leader] call FUNC(uncacheUnit);} foreach _groupUnits;
    };
} foreach GVAR(allGroups);
