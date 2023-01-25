/*
 * Author: SzwedzikPL
 * Loads logs in panel
 */
#include "script_component.hpp"
#include "\z\a4es\addons\admin\ui\idcAdminPanel.hpp"

params [["_logClass", "", [""]], ["_serverData", [], [[]]]];
TRACE_2("loadPanelLogs",_logClass,_serverData);

private _access = _logClass call FUNC(canAccessPanelModule);
if (!_access) exitWith {hint localize LSTRING(NoAccess);};

disableSerialization;
private _display = uiNamespace getVariable ["A4ES_adminPanel", displayNull];
if (isNull _display) exitWith {};

private _controlLogs = _display displayCtrl IDC_ADMINPANEL_LOGLIST;
lnbClear _controlLogs;

if (tolower _logClass == "debuglogs") then {
    _serverData params [
        ["_serverFPS", 0, [0]],
        ["_headless", false, [false]],
        ["_totalAI", 0, [0]],
        ["_serverAI", 0, [0]],
        ["_headlessAI", 0, [0]],
        ["_simulatedAI", 0, [0]],
        ["_notSimulatedAI", 0, [0]],
        ["_totalGroups", 0, [0]],
        ["_totalWaypoints", 0, [0]],
        ["_totalVehicles", 0, [0]],
        ["_simulatedVehicles", 0, [0]],
        ["_notSimulatedVehicles", 0, [0]],
        ["_totalTriggers", 0, [0]],
        ["_totalObjects", 0, [0]],
        ["_curatorCount", 0, [0]]
    ];

    _headlessOnline = [localize ELSTRING(common,No), localize ELSTRING(common,Yes)] select _headless;

    //Show logs
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_ServerFPS), str _serverFPS];
    if (isMultiplayer) then {_controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_HeadlessOnline), _headlessOnline];};
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalAICount), str _totalAI];
    if (isMultiplayer) then {_controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_AIOnServer), str _serverAI];};
    if (isMultiplayer && _headless) then {_controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_AIOnHC), str _headlessAI];};
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_SimulatedAI), str _simulatedAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_NotSimulatedAI), str _notSimulatedAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalGroupCount), str _totalGroups];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_WaypointsCount), str _totalWaypoints];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalVehicleCount), str _totalVehicles];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_SimulatedVehicles), str _simulatedVehicles];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_NotSimulatedVehicles), str _notSimulatedVehicles];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalTriggersCount), str _totalTriggers];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalObjectCount), str _totalObjects];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_CuratorCount), str _curatorCount];
};
if (tolower _logClass == "playerslist") then {
    private _players = (allPlayers - entities "HeadlessClient_F");
    {
        private _unit = _x;
        private _unitName = _unit call EFUNC(common,getUnitName);
        private _unitTimeOnServer = (time - (_unit getVariable [QGVAR(enterTime), time])) call FUNC(secondsToTime);
        private _unitAlive = [localize ELSTRING(common,No), localize ELSTRING(common,Yes)] select (alive _unit);
        private _unitDesc = format [localize LSTRING(Module_PlayersList_UnitDesc), _unitTimeOnServer, _unitAlive];
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    } foreach _players;
};
if (tolower _logClass == "adminlist") then {
    private _admins = false call FUNC(getOnlineAdmins);
    private _serverAdmin = missionNamespace getVariable [QGVAR(serverAdmin), objNull];
    private _serverAdminIncluded = false;
    {
        private _unit = _x;
        private _unitName = _unit call EFUNC(common,getUnitName);
        private _unitDesc = localize LSTRING(Module_AdminList_Admin);
        if (!_serverAdminIncluded && {_unit isEqualTo _serverAdmin}) then {
            _unitDesc = format ["%1 + %2", localize LSTRING(Module_AdminList_Admin), localize LSTRING(Module_AdminList_ServerAdmin)];
            _serverAdminIncluded = true;
        };
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    } foreach _admins;
    if (!_serverAdminIncluded && {!isNull _serverAdmin}) then {
        private _unitName = _serverAdmin call EFUNC(common,getUnitName);
        private _unitDesc = localize LSTRING(Module_AdminList_ServerAdmin);
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    };
};
if (tolower _logClass == "activescripts") then {
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach diag_activeSQFScripts;
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach diag_activeSQSScripts;
};
if (tolower _logClass == "activescriptsserver") then {
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach _serverData;
};
if (tolower _logClass == "missionlogs") then {
    {_controlLogs lnbAddRow _x;} forEach _serverData;
};
if (tolower _logClass == "adminlogs") then {
    {_controlLogs lnbAddRow _x;} forEach _serverData;
};
if (tolower _logClass == "curatorlist") then {
    {_controlLogs lnbAddRow _x;} forEach _serverData;
};
