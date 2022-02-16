/*
 * Author: SzwedzikPL
 * Toggle debug camera
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcListBox.hpp"

params [["_mode", "init", [""]]];

private _access = "endmission" call FUNC(canAccessPanelModule);
if (!_access) exitWith {hint localize LSTRING(NoAccess);};

if (_mode == "init") then {
    while {dialog} do {closeDialog 0;};
    private _dialog = createDialog "A3CS_ui_listBox";
    if (!_dialog) exitWith {};

    disableSerialization;
    private _display = uiNamespace getVariable ["A3CS_ui_listBox", displayNull];
    if (isNull _display) exitWith {};

    hint localize LSTRING(Module_EndMission_SelectMissionEnding);

    //set header title
    (_display displayCtrl IDC_LISTBOX_HEADER) ctrlSetText format [localize LSTRING(Module_EndMission_DisplayName), _unitName];
    //setup close button
    (_display displayCtrl IDC_LISTBOX_BUTTON1) ctrlSetText localize ELSTRING(Common,Close);
    (_display displayCtrl IDC_LISTBOX_BUTTON1) buttonSetAction "closeDialog 0";
    //hide mid button
    (_display displayCtrl IDC_LISTBOX_BUTTON2) ctrlShow false;
    //setup endmission button
    (_display displayCtrl IDC_LISTBOX_BUTTON3) ctrlSetText localize LSTRING(Module_EndMission_DisplayName);
    (_display displayCtrl IDC_LISTBOX_BUTTON3) buttonSetAction QUOTE('end' call FUNC(moduleEndMission));

    //Collect endings
    private _possibleEndings = [["a3c_endDefault", localize LSTRING(DefaultEnding)]];
    private _missionDebriefing = (missionConfigFile >> "CfgDebriefing");
    if (isClass _missionDebriefing) then {
        private _debriefings = "true" configClasses _missionDebriefing;
        {
            private _endingClass = configName _x;
            private _endingTitle = getText (_x >> "title");
            private _endingSubTitle = getText (_x >> "subtitle");
            private _endingDesc = _endingTitle;
            if (_endingSubTitle != "") then {
                _endingDesc = format ["%1 - %2", _endingTitle, _endingSubTitle];
            };
            _possibleEndings pushBack [_endingClass, _endingDesc];
        } forEach _debriefings;
    };

    //Prepare list
    private _controlList = _display displayCtrl IDC_LISTBOX_LIST;

    {
        _x params ["_endingClass", "_endingDesc"];
        private _index = -1;

        _index = _controlList lnbAddRow [_endingDesc];
        _controlList lnbSetData [[_index,0], _endingClass];
    } forEach _possibleEndings;
};
if (_mode == "end") then {
    disableSerialization;
    private _display = uiNamespace getVariable ["A3CS_ui_listBox", displayNull];
    if (isNull _display) exitWith {};

    private _controlList = _display displayCtrl IDC_LISTBOX_LIST;
    _selected = lnbCurSelRow _controlList;
    if (_selected < 0) then {_selected = 0;};
    private _endClass = _controlList lnbData [_selected, 0];

    hint "";
    closeDialog 0;

    //_dbLog = format [localize LSTRING(Module_EndMission_EndMissionLog), player call EFUNC(common,getUnitName)];
    //_dbLog remoteExecCall [QEFUNC(server,missionLog), 2, false];
    [_endClass, true, true, true, false] remoteExec ["BIS_fnc_endMission", 0, true];
    ["a3cs_missionEnded", _endClass] call CBA_fnc_globalEvent;
};
