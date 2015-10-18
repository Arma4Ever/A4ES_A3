#include "script_component.hpp"

params ["_player", "_unit"];
private ["_dialog", "_dialogMenu", "_unitData", "_isMedic", "_isEngineer", "_isEOD", "_index", "_squadParams", "_memberRemark"];

while {dialog} do {closeDialog 0;};

_dialog = createDialog QGVAR(select_menu);
if(!_dialog) exitWith {};

_dialogMenu = 8866;

_unitData = [_unit] call FUNC(getUnitData);
_unitData params ["_unitName", "_unitRank", "_unitIcon", "_unitColorHex", "_unitColorArma"];
_isMedic = [_unit] call ace_medical_fnc_isMedic;
_isEngineer = [_unit] call ace_common_fnc_isEngineer;
_isEOD = [_unit] call ace_common_fnc_isEOD;

ctrlSetText [8870, format [localize "STR_A3CS_Nametag_checkId_header", _unitName]];
ctrlSetText [8860, localize "STR_A3CS_Nametag_close"];

_index = lbAdd [_dialogMenu, format [localize "STR_A3CS_Nametag_checkId_nick", _unitName]];
_index = lbAdd [_dialogMenu, format [localize "STR_A3CS_Nametag_checkId_rank", _unitRank]];

_squadParams = squadParams _unit;
if(count _squadParams == 2) then {
    if(count (_squadParams select 1) == 6) then {
        _memberRemark = ((_squadParams select 0) select 5);
        if(_memberRemark != "") then {
            _index = lbAdd [_dialogMenu, format [localize "STR_A3CS_Nametag_checkId_rank_in_a3c", _memberRemark]];
        };
    };

};

if(_isMedic) then {_index = lbAdd [_dialogMenu, localize "STR_A3CS_Nametag_checkId_prems_medic"];};
if(_isEngineer) then {_index = lbAdd [_dialogMenu, localize "STR_A3CS_Nametag_checkId_prems_engineer"];};
if(_isEOD) then {_index = lbAdd [_dialogMenu, localize "STR_A3CS_Nametag_checkId_prems_eod"];};
