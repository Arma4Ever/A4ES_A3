/*
 * Author: SzwedzikPL
 * Killed EH handler
 */
#include "script_component.hpp"

params ["_unit", "_killer"];

if(!local _unit) exitWith {};

A3CS_LOGINFO_1("handleKilled %1",_this)

_lastHitPartSource = _unit getVariable ["a3cs_lastHitPartSource", _killer];

if(isServer && !isNil QUOTE(EFUNC(server,handleKilled))) then {
    [_unit, _lastHitPartSource] call EFUNC(server,handleKilled);
} else {
    [_unit, _lastHitPartSource] remoteExec [QUOTE(EFUNC(server,handleKilled)), 2];
};
