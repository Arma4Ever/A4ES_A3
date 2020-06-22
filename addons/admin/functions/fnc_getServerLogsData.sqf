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
    private _headless = false;
    private _totalAI = 0;
    private _totalGroups = 0;
    private _westGroups = 0;
    private _eastGroups = 0;
    private _greenGroups = 0;
    private _civGroups = 0;
    private _generatedAI = 0;
    private _serverAI = 0;
    private _headlessAI = 0;
    private _cachedAI = 0;
    private _uncachedAI = 0;
    private _totalWaypoints = 0;
    private _totalVehicles = 0;
    private _totalObjects = 0;
    private _modulesGenAI = 0;
    private _modulesGenAttack = 0;
    private _curatorCount = 0;

    private _headlessClient = missionNamespace getVariable [QEGVAR(mm,headlessClient), objNull];
    private _headlessClientOwner = 0;
    if (!isNull _headlessClient) then {
        _headlessClientOwner = owner _headlessClient;
        if (_headlessClientOwner != 2) then {
            _headless = true;
        };
    };

    private _allAI = allUnits select {!isPlayer _x};
    _totalAI = count _allAI;
    {
        private _unit = _x;
        private _ownerUnit = owner _unit;
        if (_ownerUnit isEqualTo 2) then {_serverAI = _serverAI + 1;};
        if (_headless && {_ownerUnit isEqualTo _headlessClientOwner}) then {_headlessAI = _headlessAI + 1;};
        if (_unit getVariable ["a3cs_generated", false]) then {_generatedAI = _generatedAI + 1;};
        if (_unit getVariable [QEGVAR(mm,cached), false]) then {_cachedAI = _cachedAI + 1;} else {_uncachedAI = _uncachedAI + 1;};
    } foreach _allAI;

    _totalGroups = count allGroups;
    {
        _totalWaypoints = _totalWaypoints + (count waypoints _x);
        if (side _x isEqualTo west) then {_westGroups = _westGroups + 1;};
        if (side _x isEqualTo east) then {_eastGroups = _eastGroups + 1;};
        if (side _x isEqualTo independent) then {_greenGroups = _greenGroups + 1;};
        if (side _x isEqualTo civilian) then {_civGroups = _civGroups + 1;};
    } forEach allGroups;

    _totalVehicles = count (vehicles select {_x isKindOf "AllVehicles"});
    _totalObjects = count (allMissionObjects "All");
    _modulesGenAI = count (entities QEGVAR(mm,module_genSoldiers));
    _modulesGenAttack = count (entities QEGVAR(mm,module_genAttack));
    _curatorCount = count (allCurators select {!(_x getVariable [QGVAR(adminCurator), false])});

    _logData = [
        _serverFPS,
        _headless,
        _totalAI,
        _totalGroups,
        _westGroups,
        _eastGroups,
        _greenGroups,
        _civGroups,
        _generatedAI,
        _serverAI,
        _headlessAI,
        _cachedAI,
        _uncachedAI,
        _totalWaypoints,
        _totalVehicles,
        _totalObjects,
        _modulesGenAI,
        _modulesGenAttack,
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
        private _curatorUnitName = _curatorUnit call EFUNC(common,getUnitName);
        if (isNull _curatorUnit) then {
            _curatorUnitName = "Brak operatora";
        };
        _logData pushBack [format ["#%1",_forEachIndex+1], _curatorUnitName];
    } forEach (allCurators select {!(_x getVariable [QGVAR(adminCurator), false])});
};

[_logClass, _logData] remoteExecCall [QFUNC(loadPanelLogs), _client];
