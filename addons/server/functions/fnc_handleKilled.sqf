/*
 * Author: SzwedzikPL
 * Killed EH (runs on serverName only)
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

//wait for data from owners
[{
    params ["_victim", "_killer"];
    private _victimName = _victim call EFUNC(common,getName);
    private _killerName = ["AI", (_killer call EFUNC(common,getName))] select (isPlayer _killer);

    A3CS_LOGINFO_1("handleKilled: %1",_this)

    //Send dead log if victim is player
    if(isPlayer _victim) then {
        private _Log = format [localize LSTRING(Log_WasKilledBy), _victimName, _killerName];
        _Log call FUNC(missionLog);
    };

    //Add kill score if killer is player?
    if(isPlayer _killer) then {

    };
}, _this, 1] call ace_common_fnc_waitAndExecute;
