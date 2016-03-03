/*
 * Author: SzwedzikPL
 * Open debug console module
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcDebugConsole.hpp"

private _access = "debugconsole" call FUNC(canAccessPanelModule);
if(!_access) exitWith {hint localize LSTRING(NoAccess);};

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_debugConsole";
if(!_dialog) exitWith {};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_debugConsole", displayNull];
if(isNull _display) exitWith {};

private _title = localize LSTRING(Module_DebugConsole_DisplayName);
(_display displayCtrl IDC_DEBUGCONSOLE_TITLE) ctrlSetText _title;

ctrlsetfocus (_display displayCtrl IDC_DEBUGCONSOLE_EXPRESSION);

(_display displayCtrl IDC_DEBUGCONSOLE_BUTTONEXECUTELOCAL) ctrladdeventhandler ["buttonclick", {
    private _code = compile ctrlText ((ctrlparent (_this select 0)) displayCtrl IDC_DEBUGCONSOLE_EXPRESSION);
    [] spawn _code;
}];
(_display displayCtrl IDC_DEBUGCONSOLE_BUTTONEXECUTESERVER) ctrladdeventhandler ["buttonclick", {
    private _code = compile ctrlText ((ctrlparent (_this select 0)) displayCtrl IDC_DEBUGCONSOLE_EXPRESSION);
    _code remoteExec ["bis_fnc_spawn", 2];
}];
(_display displayCtrl IDC_DEBUGCONSOLE_BUTTONEXECUTEGLOBAL) ctrladdeventhandler ["buttonclick", {
    private _code = compile ctrlText ((ctrlparent (_this select 0)) displayCtrl IDC_DEBUGCONSOLE_EXPRESSION);
    _code remoteExec ["bis_fnc_spawn", 0];
}];

private _callWatchFields = {
    disableSerialization;

    {
        private _inputCtrl = _x select 0;
        private _outputCtrl = _x select 1;
        private _result = call compile (ctrlText _inputCtrl);
        private _output = [str _result, ""] select (isNil {_result});
        _outputCtrl ctrlSetText _output;
    } forEach [
        [(_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHINPUT1, (_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHOUTPUT1],
        [(_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHINPUT2, (_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHOUTPUT2],
        [(_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHINPUT3, (_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHOUTPUT3],
        [(_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHINPUT4, (_this select 0) displayCtrl IDC_DEBUGCONSOLE_WATCHOUTPUT4]
    ];

};

_display displayaddeventhandler ["mousemoving", _callWatchFields];
_display displayaddeventhandler ["mouseholding", _callWatchFields];

/*
(_display displayCtrl IDC_DEBUGCONSOLE_BUTTONACTION1) ctrlSetText "ACT1";
(_display displayCtrl IDC_DEBUGCONSOLE_BUTTONACTION1) ctrladdeventhandler ["buttonclick", {}];
*/
