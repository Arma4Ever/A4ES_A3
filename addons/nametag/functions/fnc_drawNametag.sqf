#include "script_component.hpp"

params ["_target"];

private _nameTag = 3000 cutRsc [QGVAR(tag), "PLAIN"];
private _uiNametag = uiNameSpace getVariable [QGVAR(tag), displayNull];
if(isNull _uiNametag) exitWith {};

private _uiNameTagCtrl = _uiNametag displayCtrl 3600;
if(isNull _uiNameTagCtrl) exitWith {};

private _unitData = _target call FUNC(getUnitData);
_unitData params ["_unitName", "_unitRank", "_unitIcon", "_unitColorHex", "_unitColorArma"];

if(dialog || {ace_interact_menu_openedMenuType >= 0}) exitWith {_uiNameTagCtrl ctrlShow false;};

_uiNameTagCtrl ctrlSetStructuredText parseText format [
    "<t color='%4' size='1.2'>%1</t><br/><t color='#b5f279' size='0.8'>%2</t><img size='1.0' image='%3'/>",
    _unitName,
    _unitRank,
    _unitIcon,
    _unitColorHex
];
_uiNameTagCtrl ctrlCommit 0;
