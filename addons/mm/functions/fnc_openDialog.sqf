/*
	Autor: SzwedzikPL
	Opis: Otwiera dialog z daną jednostką (client)
*/
#include "script_component.hpp"

if(!hasInterface) exitWith {};

_unit = _this select 0;
_player = _this select 1;

_dialogID =  _unit getVariable ["a3c_dialog_id", ""];

if(_dialogID == "") exitWith {hint "1";};

_dialogIDStr = format ["a3c_sys_var_dialog_%1",_dialogID];
_missionDialogs = missionNamespace getVariable [_dialogIDStr,[]];

if(count _missionDialogs == 0) exitWith {hint "2";};

_dialogs = [];
{
	private ["_dialogDialog","_dialogTarget","_addDialog"];
	_dialogDialog = _x select 0;
	_dialogTarget = _x select 1;
	_addDialog = false;

	//Tablica obiektow
	if (typeName _dialogTarget == "ARRAY") then {
		if(_unit in _dialogTarget) then {_addDialog = true;};
	};
	//Strona
	if (typeName _dialogTarget == "SIDE") then {
		if(side _unit == _dialogTarget) then {_addDialog = true;};
	};
	//Wszyscy
	if (typeName _dialogTarget == "BOOL") then {
		if(_dialogTarget) then {_addDialog = true;};
	};

	if(_addDialog) then {_dialogs pushBack _dialogDialog;};
} foreach _missionDialogs;

a3c_sys_var_actualAnswers = [];
_unit setVariable ["a3c_dialog_cantalk",false,true];

_dialog = createDialog "a3cs_mm_dialogQueryGUI";
_avatar = _unit getVariable ["a3c_dialog_avatar", ""];

if(_avatar != "") then {ctrlSetText [1201, _avatar];};
{
	_index = lbAdd [1500, _x select 0];
	a3c_sys_var_actualAnswers pushBack [_index,_x select 1];
} forEach _dialogs;

if(count _dialogs > 0) then {
	//Powitanie
	_defaultDialogTextArray = [
		"O co chodzi?",
		"W czym mogę pomóc?",
		"Słucham."
	];
	_defaultDialogText = _defaultDialogTextArray call bis_fnc_selectRandom;
	ctrlSetText [1501, _defaultDialogText];
} else {
	//Spławienie
	_defaultDialogTextArray = [
		"Nie mam nic do powiedzenia.",
		"Nie mamy o czym gadać.",
		"Nic Ci nie powiem.",
		"Nie mam ochoty z Tobą rozmawiać."
	];
	_defaultDialogText = _defaultDialogTextArray call bis_fnc_selectRandom;
	ctrlSetText [1501, _defaultDialogText];
};

waitUntil {
	sleep 0.5;
	if(_player distance _unit > 4) then {closeDialog 2;};
	if(!alive _unit) then {closeDialog 2;};
	!dialog
};

_unit setVariable ["a3c_dialog_cantalk",true,true];
a3c_sys_var_actualAnswers = [];
