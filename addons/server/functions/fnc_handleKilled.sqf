/*
 * Author: SzwedzikPL
 *
 * Killed EH (runs on server & HC)
 */

#include "script_component.hpp"

params ["_victim", "_killer"];
private ["_victimName", "_killerName", "_Log"];

if(hasInterface) exitWith {};

if(isPlayer _victim) then {
    //player logs only on dedicated
    if(!isDedicated) exitWith {};

    //send dead log
    _victimName = _victim getVariable ["ACE_Name", name _victim];
    _killerName = _killer getVariable ["ACE_Name", name _killer];

    if(!isPlayer _killer) then {_killerName = "AI";};

    _Log = format ["%1 zostal zabity przez %2", _victimName, _killerName];

    [_Log] call FUNC(missionLog);
};

if(isPlayer _killer) then {
    //score kill?
};
