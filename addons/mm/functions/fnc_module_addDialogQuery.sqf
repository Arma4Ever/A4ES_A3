/*
	Autor: SzwedzikPL
	Opis: Dodaje pytanie & odpowiedz do rozmowy z jednostką (client)
*/
#include "script_component.hpp"

if(!isServer) exitWith {};

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!_activated) exitWith {};

_dialogID = _logic getVariable ["dialogID", ""];
_dialogQuestion = _logic getVariable ["dialogQuestion", ""];
_dialogAnswer = _logic getVariable ["dialogAnswer", ""];
_dialogTarget = call compile (_logic getVariable ["dialogTarget", ""]);

_dialogQuery = [_dialogQuestion, _dialogAnswer];

if(_dialogID == "") exitWith {["Niepoprawne ID rozmowy"] call bis_fnc_error;};
if(count _dialogQuery != 2) exitWith {["Niepoprawna definicja rozmowy"] call bis_fnc_error;};
if((_dialogQuery select 0) == "" || (_dialogQuery select 1) == "") exitWith {["Niepoprawna definicja rozmowy"] call bis_fnc_error;};

_dialogIDStr = format ["a3c_sys_var_dialog_%1",_dialogID];

_missionDialogs = missionNamespace getVariable [_dialogIDStr,[]];
_missionDialogs pushBack [_dialogQuery,_dialogTarget];
missionNamespace setVariable [_dialogIDStr, _missionDialogs, true];
