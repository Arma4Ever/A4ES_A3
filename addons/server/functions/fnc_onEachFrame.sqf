/*
 * Author: SzwedzikPL
 * Send SQL query to DB
 */
#include "script_component.hpp"

if(GVAR(serverState) != getClientState) then {
    GVAR(serverState) = getClientState;

    //get mission data
    private _missionData = call EFUNC(common,getMissionData);
    _missionData params ["_missionName", "_missionMap"];

    private _missionID = "missionid" call EFUNC(common,getSingleMissionData);

    //delete old status
    private _sql = ["DELETE FROM server_status WHERE 1"] call FUNC(queryDB);

    //add new status
    private _query = format [
        "INSERT INTO server_status (status_id, status_map, status_mission_name, status_mission_id) VALUES ('%1', '%2', '%3', '%4')",
        GVAR(serverState),
        _missionMap,
        _missionName,
        _missionID
    ];

    _sql = _query call FUNC(queryDB);

    if(GVAR(serverState) == "BRIEFING READ") then {
        [localize LSTRING(Log_MissionStart)] call FUNC(missionLog);
    };
    if(GVAR(serverState) == "LOGGED IN") then {
        [localize LSTRING(Log_MissionEnd)] call FUNC(missionLog);
    };
};
