/*
 * Author: SzwedzikPL
 * OnLoad EH of admin panel
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if (isNull _display) exitWith {};

private _headerText = [localize LSTRING(AdminPanelSP), localize LSTRING(AdminPanel)] select (isMultiplayer);
(_display displayCtrl IDC_ADMINPANEL_HEADER) ctrlSetText _headerText;
(_display displayCtrl IDC_ADMINPANEL_LOGSTYPELABEL) ctrlSetText localize LSTRING(SelectLogsLabel);

//Load logs
private _availableLogs = [[localize ELSTRING(Common,None), "none"]];
private _logsTypes = "getNumber (_x >> 'type') == 1" configClasses (configFile >> QGVAR(modules));
{
    private _logConfig = _x;
    private _logClass = configName _logConfig;
    private _canAccess = _logClass call FUNC(canAccessPanelModule);
    if (_canAccess) then {
        _logModuleName = getText (_logConfig >> "displayName");
        _availableLogs pushBack [_logModuleName, _logClass];
    };
} forEach _logsTypes;
private _controlLogsType = _display displayCtrl IDC_ADMINPANEL_LOGSTYPESELECTION;
{
    _x params ["_logName", "_logClass"];
    private _index = _controlLogsType lbAdd _logName;
    _controlLogsType lbSetData [_index, _logClass];
} forEach _availableLogs;
_controlLogsType lbSetCurSel 0;

//Load actions
private _availableActions = [];
private _actions = "getNumber (_x >> 'type') in [0,2,3]" configClasses (configFile >> QGVAR(modules));
{
    private _actionConfig = _x;
    private _actionClass = configName _actionConfig;
    private _canAccess = _actionClass call FUNC(canAccessPanelModule);
    if (_canAccess) then {
        private _actionType = getNumber (_actionConfig >> "type");
        private _actionName = getText (_actionConfig >> "displayName");
        private _actionFunction = getText (_actionConfig >> "function");
        if (_actionType isEqualTo 3) then {
            private _actionVariable = getText (_actionConfig >> "variable");
            private _actionVariableDefaultValue = getNumber (_actionConfig >> "defaultValue");
            private _moduleVariable = missionNamespace getVariable [_actionVariable, _actionVariableDefaultValue];
            private _actionValues = getArray (_actionConfig >> "values");
            _actionName = format [_actionName, _actionValues select _moduleVariable];
        };
        private _actionCode = format ["'%1' call %2", _actionClass, QFUNC(openPanelModule)];
        _availableActions pushBack [_actionClass, _actionType, _actionName, _actionCode];
    };
} forEach _actions;
private _actionButtons = [IDC_ADMINPANEL_PANELACTION_1,IDC_ADMINPANEL_PANELACTION_2,IDC_ADMINPANEL_PANELACTION_3,IDC_ADMINPANEL_PANELACTION_4,IDC_ADMINPANEL_PANELACTION_5];
private _activeActionButtons = [];
GVAR(panelActiveButtons) = [];
GVAR(panelActiveButtonsActions) = [];
{
    _x params ["_actionClass", "_actionType", "_actionName", "_actionCode"];
    if (_actionType == 0) then {
        //EndMission
        (_display displayCtrl IDC_ADMINPANEL_PANELACTIONENDMISSION) ctrlSetText _actionName;
        (_display displayCtrl IDC_ADMINPANEL_PANELACTIONENDMISSION) buttonSetAction _actionCode;
    } else {
        //Other actions
        _activeButtonsCount = count GVAR(panelActiveButtons);
        if (_activeButtonsCount < (count _actionButtons)) then {
            _actionButton = _actionButtons select _activeButtonsCount;
            (_display displayCtrl _actionButton) ctrlSetText _actionName;
            (_display displayCtrl _actionButton) buttonSetAction _actionCode;
            GVAR(panelActiveButtons) pushBack _actionButton;
            GVAR(panelActiveButtonsActions) pushBack (tolower _actionClass);
        };
    };
} forEach _availableActions;

//Load mission data
(_display displayCtrl IDC_ADMINPANEL_MISSIONDATALABEL) ctrlSetText localize LSTRING(MissionDataLabel);
[FUNC(updatePanelMissionData), 1, []] call CBA_fnc_addPerFrameHandler;
