/*
 * Author: SzwedzikPL
 * OnChange EH of admin panel log type select
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if(isNull _display) exitWith {};

private _controlLogsType = _display displayCtrl IDC_ADMINPANEL_LOGSTYPESELECTION;
private _logClass = _controlLogsType lbData (lbCurSel _controlLogsType);
private _controlLogs = _display displayCtrl IDC_ADMINPANEL_LOGLIST;

if(_logClass == "none") exitWith {lnbClear _controlLogs;_controlLogs lnbAddRow [localize LSTRING(NoLogs), ""];};

private _access = _logClass call FUNC(canAccessPanelModule);
if(!_access) exitWith {hint localize LSTRING(NoAccess);};

private _needServer = (getNumber (configFile >> QGVAR(modules) >> _logClass >> "server")) > 0;
lnbClear _controlLogs;
_controlLogs lnbAddRow [localize LSTRING(LoadingLogs), ""];
if(_needServer) then {
    [player, _logClass] remoteExecCall [QFUNC(getServerLogsData), 2];
} else {
    [_logClass, []] call FUNC(loadPanelLogs);
};
