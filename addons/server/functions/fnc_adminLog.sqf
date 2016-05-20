/*
 * Author: SzwedzikPL
 * Saves admin log
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_log", "", [""]]];
if (_log == "") exitWith {};

private _adminLogs = missionNamespace getVariable [QGVAR(adminLogs), []];
if ((count _adminLogs) >= 30) then {_adminLogs deleteAt 0;};

private _logTime = time call EFUNC(common,secondsToTime);
_adminLogs pushback [_logTime, _log];
missionNamespace setVariable [QGVAR(adminLogs), _adminLogs];
