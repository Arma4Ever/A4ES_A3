/*
 * Author: SzwedzikPL
 * Prepare logs data on server and send it to client
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params ["_client", "_logClass"];

private _logData = [];
if(tolower _logClass == "debuglogs") then {
    private _serverFPS = floor diag_fps;
    private _headless = false;
    private _totalAI = 0;
    private _totalGroups = 0;
    private _generatedAI = 0;
    private _serverAI = 0;
    private _headlessAI = 0;
    private _cachedAI = 0;
    private _uncachedAI = 0;
    private _totalWaypoints = 0;
    private _totalVehicles = 0;
    private _curatorCount = 0;

    private _headlessOwner = 0;
    if(!isNil "a3c_headlessClient" || {!isNull a3c_headlessClient}) then {
        _headlessOwner = owner a3c_headlessClient;
        if(_headlessOwner != 2) then {_headless = true;};
    };

    _allAI = allUnits select {!isPlayer _x};
    _totalAI = count _allAI;
    {
        private _unit = _x;
        private _ownerUnit = owner _unit;
        if(_ownerUnit isEqualTo 2) then {_serverAI = _serverAI + 1;};
        if(_headless && {_ownerUnit isEqualTo _headlessOwner}) then {_headlessAI = _headlessAI + 1;};
        if(_unit getVariable ["a3cs_generated", false]) then {_generatedAI = _generatedAI + 1;};
        if(_unit getVariable [QEGVAR(mm,cached), false]) then {_cachedAI = _cachedAI + 1;} else {_uncachedAI = _uncachedAI + 1;};
    } foreach _allAI;

    _totalGroups = count allGroups;
    {_totalWaypoints = _totalWaypoints + (count waypoints _x);} forEach allGroups;
    _totalVehicles = count vehicles;
    _curatorCount = count allCurators;

    _logData = [_serverFPS, _headless, _totalAI, _totalGroups, _generatedAI, _serverAI, _headlessAI, _cachedAI, _uncachedAI, _totalWaypoints, _totalVehicles, _curatorCount];
};
if(tolower _logClass == "activescriptsserver") then {
    {
        _x params ["_scriptName", "_fileName"];
        _logData pushBack [_scriptName, _fileName];
    } forEach diag_activeSQFScripts;
};

[_logClass, _logData] remoteExecCall [QFUNC(loadPanelLogs), _client];
