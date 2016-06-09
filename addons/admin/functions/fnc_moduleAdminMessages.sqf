/*
 * Author: SzwedzikPL
 * Admin panel messages module
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcEditBox.hpp"

params [["_targetClass", "", [""]]];

private _access = "adminmessages" call FUNC(canAccessPanelModule);
if (!_access) exitWith {hint localize LSTRING(NoAccess);};

private _targetClasses = ["admins", "public"];

if (!(_targetClass in _targetClasses)) then {
    //First open
    while {dialog} do {closeDialog 0;};

    private _dialog = createDialog "A3CS_ui_editBox";
    if (!_dialog) exitWith {};

    disableSerialization;
    private _display = uiNamespace getVariable ["A3CS_ui_editBox", displayNull];
    if (isNull _display) exitWith {};

    (_display displayCtrl IDC_EDITBOX_HEADER) ctrlsetText localize LSTRING(Module_AdminMessages_Header);
    (_display displayCtrl IDC_EDITBOX_TEXTINPUTLABEL) ctrlsetText localize LSTRING(Module_AdminMessages_InputLabel);
    (_display displayCtrl IDC_EDITBOX_BUTTON1) ctrlsetText localize ELSTRING(common,Close);
    (_display displayCtrl IDC_EDITBOX_BUTTON1) buttonSetAction "closeDialog 0";
    (_display displayCtrl IDC_EDITBOX_BUTTON2) ctrlsetText localize LSTRING(Module_AdminMessages_SendToAdmins);
    (_display displayCtrl IDC_EDITBOX_BUTTON2) buttonSetAction QUOTE('admins' call FUNC(moduleAdminMessages));
    (_display displayCtrl IDC_EDITBOX_BUTTON3) ctrlsetText localize LSTRING(Module_AdminMessages_SendToAll);
    (_display displayCtrl IDC_EDITBOX_BUTTON3) buttonSetAction QUOTE('public' call FUNC(moduleAdminMessages));
} else {
    //Button click
    disableSerialization;
    private _display = uiNamespace getVariable ["A3CS_ui_editBox", displayNull];
    if (isNull _display) exitWith {};

    private _playerName = player call EFUNC(common,getName);

    private _message = ctrlText (_display displayCtrl IDC_EDITBOX_TEXTINPUT);
    if (_targetClass == "public") then {
        [_playerName, _message] remoteExecCall [QFUNC(showAdminMessage), 0];
    };
    if (_targetClass == "admins") then {
        private _onlineAdmins = true call FUNC(getOnlineAdmins);
        [_playerName, _message] remoteExecCall [QFUNC(showAdminMessage), _onlineAdmins];
    };
    closeDialog 0;
};
