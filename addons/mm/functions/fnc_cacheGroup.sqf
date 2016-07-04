/*
 * Author: SzwedzikPL
 * Cache group
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_group"];

private _groupUnits = units _group;
private _groupLeader = leader _group;
{
    private _unit = _x;
    private _canCache = true;
    private _unitSetting = _unit getVariable [QGVAR(cacheUnit), "always"];
    //check if unit should can be hidden
    if (!isNull objectParent _unit) then {_canCache = false;};
    if (_unitSetting == "never") then {_canCache = false;};
    if (_unit == _groupLeader && {_unitSetting == "noifleader"}) then {_canCache = false;};
    if (_unit getVariable [QGVAR(cached), false]) then {_canCache = false;};
    if (_canCache) then {
        private _cacheData = [getPosATL _unit, getDir _unit];
        _unit setVariable [QGVAR(cacheData), _cacheData];
        _unit setVariable [QGVAR(cached), true];
        _unit enableSimulationGlobal false;
        _unit hideObjectGlobal true;
    };
} foreach _groupUnits;

if (local _group) then {
    _group call FUNC(disableGroupAI);
} else {
    _group remoteExecCall [QFUNC(disableGroupAI), groupOwner _group, false];
};
