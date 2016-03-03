/*
 * Author: SzwedzikPL
 * Loads logs in panel
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

params [["_logClass", "", [""]], ["_serverData", [], [[]]]];

A3CS_LOGINFO_1("loadPanelLogs: %1",_this)

private _access = _logClass call FUNC(canAccessPanelModule);
if(!_access) exitWith {hint localize LSTRING(NoAccess);};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if(isNull _display) exitWith {};

private _controlLogs = _display displayCtrl IDC_ADMINPANEL_LOGLIST;
lnbClear _controlLogs;

if(tolower _logClass == "debuglogs") then {
    _serverData params [
        ["_serverFPS", 0, [0]],
        ["_headless", false, [false]],
        ["_totalAI", 0, [0]],
        ["_totalGroups", 0, [0]],
        ["_generatedAI", 0, [0]],
        ["_serverAI", 0, [0]],
        ["_headlessAI", 0, [0]],
        ["_cachedAI", 0, [0]],
        ["_uncachedAI", 0, [0]],
        ["_totalWaypoints", 0, [0]],
        ["_totalVehicles", 0, [0]],
        ["_curatorCount", 0, [0]]
    ];

    _headlessOnline = [localize ELSTRING(common,No), localize ELSTRING(common,Yes)] select _headless;

    //Show logs
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_ServerFPS), str _serverFPS];
    if(isMultiplayer) then {_controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_HeadlessOnline), _headlessOnline];};
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalAICount), str _totalAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalGroupCount), str _totalGroups];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_GeneratedAICount), str _generatedAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_AIOnServer), str _serverAI];
    if(isMultiplayer && _headless) then {_controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_AIOnHC), str _headlessAI];};
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_CachedAI), str _cachedAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_UncachedAI), str _uncachedAI];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_WaypointsCount), str _totalWaypoints];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_TotalVehicleCount), str _totalVehicles];
    _controlLogs lnbAddRow [localize LSTRING(Module_DebugLogs_CuratorCount), str _curatorCount];

};
if(tolower _logClass == "playerslist") then {
    private _players = (allPlayers - entities "HeadlessClient_F");
    {
        private _unit = _x;
        private _unitName = _unit call EFUNC(common,getName);
        private _unitTimeOnServer = (time - (_unit getVariable [QGVAR(enterTime), time])) call EFUNC(common,secondsToTime);
        private _unitAlive = [localize ELSTRING(common,No), localize ELSTRING(common,Yes)] select (alive _unit);
        private _unitDesc = format [localize LSTRING(Module_PlayersList_UnitDesc), _unitTimeOnServer, _unitAlive];
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    } foreach _players;
};
if(tolower _logClass == "adminlist") then {
    private _admins = false call FUNC(getOnlineAdmins);
    private _serverAdmin = missionNamespace getVariable [QGVAR(serverAdmin), objNull];
    private _serverAdminIncluded = false;
    {
        private _unit = _x;
        private _unitName = _unit call EFUNC(common,getName);
        private _unitDesc = localize LSTRING(Module_AdminList_Admin);
        if(!_serverAdminIncluded && {_unit isEqualTo _serverAdmin}) then {
            _unitDesc = format ["%1 + %2", localize LSTRING(Module_AdminList_Admin), localize LSTRING(Module_AdminList_ServerAdmin)];
            _serverAdminIncluded = true;
        };
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    } foreach _admins;
    if(!_serverAdminIncluded && {!isNull _serverAdmin}) then {
        private _unitName = _serverAdmin call EFUNC(common,getName);
        private _unitDesc = localize LSTRING(Module_AdminList_ServerAdmin);
        _controlLogs lnbAddRow [_unitName, _unitDesc];
    };
};
if(tolower _logClass == "activescripts") then {
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach diag_activeSQFScripts;
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach diag_activeSQSScripts;
};
if(tolower _logClass == "activescriptsserver") then {
    {
        _x params ["_scriptName", "_fileName"];
        _controlLogs lnbAddRow [_scriptName, _fileName];
    } forEach _serverData;
};
if(tolower _logClass == "missionlogs") then {
    {_controlLogs lnbAddRow _x;} forEach _serverData;
};
