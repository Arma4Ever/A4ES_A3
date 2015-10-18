/*
 * Author: SzwedzikPL
 *
 * Send SQL query to DB
 */
#include "script_component.hpp"

if(GVAR(status_id) != getClientState) then {
    GVAR(status_id) = getClientState;
    //DB data
    private ["_missionName", "_missionID", "_map", "_query", "_sql"];

    //get mission data
    _missionData = call FUNC(getMissionData);
    _missionData params ["_map", "_missionName", "_missionID"];

    //delete old status
    _sql = ["DELETE FROM server_status WHERE 1"] call FUNC(queryDB);

    //add new status
    _query = format [
        "INSERT INTO server_status (status_id, status_map, status_mission_name, status_mission_id) VALUES('%1', '%2', '%3', '%4')",
        GVAR(status_id),
        _map,
        _missionName,
        _missionID
    ];

    _sql = [_query] call FUNC(queryDB);

    if(GVAR(status_id) == "BRIEFING READ") then {
        ["Uruchomiono misje"] call FUNC(missionLog);
    };
    if(GVAR(status_id) == "LOGGED IN") then {
        ["Zakonczono misje"] call FUNC(missionLog);
    };
};
