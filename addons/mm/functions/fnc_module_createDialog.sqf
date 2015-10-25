/*
	Autor: SzwedzikPL
	Opis: Dodaje możliwosć rozmowy z jednostką (server)
*/
#include "script_component.hpp"

if(!isServer) exitWith {};

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!_activated) exitWith {};

_dialogID = _logic getVariable ["dialogID", ""];
_unit = call compile (_logic getVariable ["unit", ""]);
_avatar = _logic getVariable ["avatar", ""];

if(_dialogID == "") exitWith {["Niepoprawne ID rozmowy"] call bis_fnc_error;};
if (isNull _unit) exitWith {["Podano niepoprawna jednostke"] call bis_fnc_error;};

_unit setVariable ["a3c_dialog_id", _dialogID, true];
_unit setVariable ["a3c_dialog_avatar", _avatar, true];
_unit setVariable ["a3c_dialog_cantalk", true, true];

_dialogUnits = missionNamespace getVariable ["a3c_sys_var_dialogUnits",[]];

if(!(_unit in _dialogUnits)) then {
	[
		[_unit],
		QFUNC(createDialogLocal),
		true,
		true,
		true
	] call BIS_fnc_MP;
	_dialogUnits pushBack _unit;
	missionNamespace setVariable ["a3c_sys_var_dialogUnits",_dialogUnits];
};
