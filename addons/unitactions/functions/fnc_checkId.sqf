/*
 * Author: SzwedzikPL
 * Check ID of unit
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcListBox.hpp"

params ["_player", "_unit"];

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_ui_listBox";
if(!_dialog) exitWith {};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_ui_listBox", displayNull];
if(isNull _display) exitWith {};

if(isPlayer _unit && {!(_player isEqualTo _unit)}) then {
    private _playerName = _player call EFUNC(common,getName);
    private _hintText = format [localize LSTRING(CheckID_Notification), _playerName];
    _hintText remoteExecCall ["hint", _unit];
};

private _unitData = _unit call EFUNC(nametag,getUnitData);
_unitData params ["_unitName", "_unitRank"];

private _roleDesc = roleDescription _unit;
if(_roleDesc == "") then {_roleDesc = tolower localize ELSTRING(Common,None);};

private _isEOD = (_unit call ace_common_fnc_isEOD) isEqualTo true;
private _isEngineer = (_unit call ace_common_fnc_isEngineer) isEqualTo true;
private _isMedic = (_unit call ace_medical_fnc_isMedic) isEqualTo true;

//set header title
(_display displayCtrl IDC_LISTBOX_HEADER) ctrlSetText format [localize LSTRING(CheckID_ListHeader), _unitName];
//setup close button
(_display displayCtrl IDC_LISTBOX_BUTTON3) ctrlSetText localize ELSTRING(Common,Close);
(_display displayCtrl IDC_LISTBOX_BUTTON3) buttonSetAction "closeDialog 0";
//hide 2 buttons
(_display displayCtrl IDC_LISTBOX_BUTTON1) ctrlShow false;
(_display displayCtrl IDC_LISTBOX_BUTTON2) ctrlShow false;

private _controlList = _display displayCtrl IDC_LISTBOX_LIST;
private _index = 0;
_index = _controlList lbAdd format [localize LSTRING(CheckID_Name), _unitName];
_index = _controlList lbAdd format [localize LSTRING(CheckID_Rank), _unitRank];
_index = _controlList lbAdd format [localize LSTRING(CheckID_Desc), _roleDesc];
if(_isMedic) then {_index = _controlList lbAdd format [localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Medic)];};
if(_isEngineer) then {_index = _controlList lbAdd format [localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Engineer)];};
if(_isEOD) then {_index = _controlList lbAdd format [localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Eod)];};

/*
_squadParams = squadParams _unit;
if(count _squadParams == 2) then {
    if(count (_squadParams select 1) == 6) then {
        _memberRemark = ((_squadParams select 0) select 5);
        if(_memberRemark != "") then {
            _index = lbAdd [_dialogMenu, format [localize "STR_A3CS_Nametag_checkId_rank_in_a3c", _memberRemark]];
        };
    };
};
*/
