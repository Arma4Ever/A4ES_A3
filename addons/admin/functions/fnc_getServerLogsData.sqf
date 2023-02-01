/*
 * Author: SzwedzikPL
 * Prepare logs data on server and send it to client
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_client", "_logClass"];

private _logData = [];

if (tolower _logClass == "debuglogs") then {
    private _serverFPS = floor diag_fps;
    private _headlessFPS = [];
    private _totalAI = 0;
    private _serverAI = 0;
    private _headlessAI = [];
    private _simulatedAI = 0;
    private _notSimulatedAI = 0;
    private _totalWaypoints = 0;
    private _totalGroups = {
      _totalWaypoints = _totalWaypoints + (count (waypoints _x));
      true
    } count allGroups;
    private _simulatedVehicles = 0;
    private _notSimulatedVehicles = 0;

    private _totalVehicles = {
      if (simulationEnabled _x) then {
        _simulatedVehicles = _simulatedVehicles + 1;
      } else {
        _notSimulatedVehicles = _notSimulatedVehicles + 1;
      };
      true
    } count vehicles;

    private _totalTriggers = count (allMissionObjects "EmptyDetector");
    private _totalObjects = count (allMissionObjects "All");
    private _curatorCount = count allCurators;

    private _headlessClients = EGVAR(headless,headlessClients);
    private _headlessOwners = _headlessClients apply {owner _x};
    private _hasHeadless = (count _headlessClients) > 0;

    if (_hasHeadless) then {
      _headlessFPS = _headlessClients apply {_x getVariable [QEGVAR(headless,diagFPS), 0]};
      _headlessAI = _headlessClients apply {0};
      // Request fps update from headless clients so in next refresh they could be updated
      [QEGVAR(headless,requestFPS), [], _headlessClients] call CBA_fnc_targetEvent;
    };

    private _allAI = allUnits select {!isPlayer _x};
    _totalAI = {
      private _unit = _x;
      private _ownerUnit = owner _unit;
      if (_ownerUnit isEqualTo 2) then {_serverAI = _serverAI + 1;};
      if (_hasHeadless && {_ownerUnit in _headlessOwners}) then {
        private _index = _headlessOwners find _ownerUnit;
        _headlessAI set [_index, (_headlessAI select _index) + 1];
      };
      if (simulationEnabled _unit) then {_simulatedAI = _simulatedAI + 1;} else {_notSimulatedAI = _notSimulatedAI + 1;};
      true
    } count _allAI;

    _logData = [
      _serverFPS,
      _headlessFPS,
      _totalAI,
      _serverAI,
      _headlessAI,
      _simulatedAI,
      _notSimulatedAI,
      _totalGroups,
      _totalWaypoints,
      _totalVehicles,
      _simulatedVehicles,
      _notSimulatedVehicles,
      _totalTriggers,
      _totalObjects,
      _curatorCount
    ];
};
if (tolower _logClass == "activescriptsserver") then {
    {
        _x params ["_scriptName", "_fileName"];
        _logData pushBack [_scriptName, _fileName];
    } forEach diag_activeSQFScripts;
};
if (tolower _logClass == "missionlogs") then {
    _logData = missionNamespace getVariable [QEGVAR(server,missionLogs), []];
};
if (tolower _logClass == "adminlogs") then {
    _logData = missionNamespace getVariable [QEGVAR(server,adminLogs), []];
};
if (tolower _logClass == "curatorlist") then {
    {
        private _curatorUnit = getAssignedCuratorUnit _x;
        private _curatorUnitName = "Brak operatora";
        if !(isNull _curatorUnit) then {
            _curatorUnitName = _curatorUnit call EFUNC(common,getUnitName);
        };
        _logData pushBack [format ["#%1",_forEachIndex+1], _curatorUnitName];
    } forEach allCurators;
};

[_logClass, _logData] remoteExecCall [QFUNC(loadPanelLogs), _client];
