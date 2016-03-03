/*
 * Author: SzwedzikPL
 * Send mission log to DB
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params [["_log", "", [""]]];
if(_log == "") exitWith {};

private _missionData = call EFUNC(common,getMissionData);
_missionData params ["_missionName", "_missionMap"];

private _missionLogs = missionNamespace getVariable [QGVAR(missionLogs), []];
if((count _missionLogs) >= 20) then {_missionLogs deleteAt 0;};

private _logTime = time call EFUNC(common,secondsToTime);
_missionLogs pushback [_logTime, _log];
missionNamespace setVariable [QGVAR(missionLogs), _missionLogs];

//add log to DB
private _query = format [
    "INSERT INTO mission_logs (mission_log_map, mission_log_mission, mission_log_data) VALUES ('%1', '%2', '%3')",
    _missionMap,
    _missionName,
    _log
];

private _sql = _query call FUNC(queryDB);
