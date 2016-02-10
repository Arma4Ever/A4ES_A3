/*
 * Author: SzwedzikPL
 * Cache group
 */
#include "script_component.hpp"

if(!isServer) exitWith {};
params ["_group"];

private _groupUnits = units _group;
private _cachedUnitCount = 0;
{
    private _unit = _x;
    private _canCache = true;
    private _unitSetting = _unit getVariable [QGVAR(cacheUnit), "always"];
    //check if unit should can be hidden
    if(!isNull objectParent _unit) then {_canCache = false;};
    if(_unitSetting == "never") then {_canCache = false;};
    if(_unit == leader _group && {_unitSetting == "noifleader"}) then {_canCache = false;};
    if(_unit getVariable [QGVAR(cached), false]) then {_canCache = false;};
    if(_canCache) then {
        private _cacheData = [getPosATL _unit, getDir _unit];
        _unit setVariable [QGVAR(cacheData), _cacheData];
        _unit setVariable [QGVAR(cached), true];
        _unit enableSimulationGlobal false;
        _unit hideObjectGlobal true;
        _cachedUnitCount = _cachedUnitCount + 1;
    };
} foreach _groupUnits;

_cachedUnitCount
