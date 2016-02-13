/*
 * Author: SzwedzikPL
 * Check ID of unit
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcSelectMenu.hpp"

params ["_player", "_unit"];

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_ui_selectMenu";
if(!_dialog) exitWith {};

private _unitData = _unit call EFUNC(nametag,getUnitData);
_unitData params ["_unitName", "_unitRank"];

private _roleDesc = roleDescription _unit;
if(_roleDesc == "") then {_roleDesc = tolower localize ELSTRING(Common,None);};

private _isMedic = _unit call ace_medical_fnc_isMedic;
private _isEngineer = _unit call ace_common_fnc_isEngineer;
private _isEOD = _unit call ace_common_fnc_isEOD;
if(_isMedic isEqualType 0) then {_isMedic = _isMedic > 0;};
if(_isEngineer isEqualType 0) then {_isEngineer = _isEngineer > 0;};
if(_isEOD isEqualType 0) then {_isEOD = _isEOD > 0;};

//set header title
ctrlSetText [IDC_SELECTMENU_HEADER, format [localize LSTRING(CheckID_ListHeader), _unitName]];
//hide left button
ctrlShow [IDC_SELECTMENU_BUTTON1, false];
ctrlShow [IDC_SELECTMENU_BUTTON1BG, false];
//setup right button
ctrlSetText [IDC_SELECTMENU_BUTTON2, localize ELSTRING(Common,Close)];
buttonSetAction [IDC_SELECTMENU_BUTTON2, "closeDialog 0"];

private _index = 0;
_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format [localize LSTRING(CheckID_Name), _unitName]];
_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format [localize LSTRING(CheckID_Rank), _unitRank]];
_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format [localize LSTRING(CheckID_Desc), _roleDesc]];
if(_isMedic) then {_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format ["%1 %2", localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Medic)];};
if(_isEngineer) then {_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format ["%1 %2", localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Engineer)];};
if(_isEOD) then {_index = lbAdd [IDC_SELECTMENU_ITEMLIST, format ["%1 %2", localize LSTRING(CheckID_Prems), localize LSTRING(CheckID_Eod)];};

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
