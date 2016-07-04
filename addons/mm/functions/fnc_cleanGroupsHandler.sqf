/*
 * Author: SzwedzikPL
 * Clean PFH for groups
 */
#include "script_component.hpp"

//Check allgroups
{
    private _group = _x;
    if (({alive _x} count (units _group)) == 0) then {
        if (local _group) then {
            [_group] call FUNC(deleteGroup);
        } else {
            [_group] remoteExecCall [QFUNC(deleteGroup), groupOwner _group];
        };
        if (_group in GVAR(cacheGroups)) then {
            GVAR(cacheGroups) deleteAt (GVAR(cacheGroups) find _group);
        };
    };
} forEach allGroups;
