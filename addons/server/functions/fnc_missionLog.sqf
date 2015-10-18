/*
 * Author: SzwedzikPL
 *
 * Send mission log to DB
 */
#include "script_component.hpp"

params [["_log", "", [""]]];
if(_log == "") exitWith {};

private ["_missionData", "_query", "_sql"];

_missionData = call FUNC(getMissionData);
_missionData params ["_map", "_missionName", "_missionID"];

//add log to DB
_query = format [
    "INSERT INTO mission_logs (mission_log_map, mission_log_mission, mission_log_data) VALUES('%1', '%2', '%3')",
    _map,
    _missionName,
    _log
];

_sql = [_query] call FUNC(queryDB);
