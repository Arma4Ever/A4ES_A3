/*
 * Author: SzwedzikPL
 * Killed EH handler
 */
#include "script_component.hpp"

params ["_unit", "_killer"];

if (!local _unit) exitWith {};

TRACE_1("handleKilled",_this);

if (isServer && !isNil QUOTE(EFUNC(server,handleKilled))) then {
    [_unit, _killer] call EFUNC(server,handleKilled);
} else {
    [_unit, _killer] remoteExec [QUOTE(EFUNC(server,handleKilled)), 2];
};
