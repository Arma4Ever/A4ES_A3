#include "script_component.hpp"

if(!isServer) exitWith {};

[QGVAR(onPlayerConnected), "onPlayerConnected", {
    A3CS_LOGINFO_5("onPlayerConnected [id:%1, name:%2, uid:%3, owner:%4, jip:%5]",_id,_name,_uid,_owner,_jip)
    if(_uid != "" && _name != "headlessclient") then {
        [format [localize LSTRING(Log_PlayerConnected), _name]] call FUNC(missionLog);
    };
}] call BIS_fnc_addStackedEventHandler;

[QGVAR(onPlayerDisconnected), "onPlayerDisconnected", {
    A3CS_LOGINFO_5("onPlayerDisconnected [id:%1, name:%2, uid:%3, owner:%4, jip:%5]",_id,_name,_uid,_owner,_jip)
    if(_uid != "" && _name != "headlessclient") then {
        [format [localize LSTRING(Log_PlayerDisconnected), _name]] call FUNC(missionLog);
    };
}] call BIS_fnc_addStackedEventHandler;

//Refresh curator points
if(count allCurators > 0) then {[] call FUNC(curatorPointsLoop);};

//Update game status in DB every 60s
//[FUNC(updateGameStatus), 60, []] call CBA_fnc_addPerFrameHandler;

//Update server status in DB
[FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;

//Send nametag data after 2s
[FUNC(sendNametagData), [], 2] call ace_common_fnc_waitAndExecute;
