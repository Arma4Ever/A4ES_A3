#include "script_component.hpp"

if(!isDedicated) exitWith {};

//Killed EH for players
{
    _x addMPEventHandler ["mpkilled", {_this call FUNC(handleKilled)}];
} foreach playableUnits;

[QGVAR(onPlayerConnected), "onPlayerConnected", {
    diag_log ["onPlayerConnected", _id, _name, _uid, _owner, _jip];
    if(_uid != "" && _name != "headlessclient") then {
        [format ["%1 wszedl na serwer", _name]] call FUNC(missionLog);
    };
}] call BIS_fnc_addStackedEventHandler;

[QGVAR(onPlayerDisconnected), "onPlayerDisconnected", {
    diag_log ["onPlayerDisconnected", _id, _name, _uid, _owner, _jip];
    if(_uid != "" && _name != "headlessclient") then {
        [format ["%1 wyszedl z serwera", _name]] call FUNC(missionLog);
    };
}] call BIS_fnc_addStackedEventHandler;

//Update game status in DB every 60s
[FUNC(updateGameStatus), 60, []] call CBA_fnc_addPerFrameHandler;

//Update server status in DB
[FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;

//Send nametag data after 2s
[FUNC(sendNametagData), [], 2] call ace_common_fnc_waitAndExecute;
