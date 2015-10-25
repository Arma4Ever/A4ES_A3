/*
	Autor: SzwedzikPL
	Opis: Zmienia trigger/marker w strefę smierci dla danego typu jednostek (server)
*/
#include "script_component.hpp"

if(!isServer) exitWith {};

_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

    _zoneArea = call compile (_logic getVariable ["zoneArea", ""]);
    _zoneTarget = call compile (_logic getVariable ["zoneTarget", ""]);
    _zoneSpecCond = compile (_logic getVariable ["zoneSpecCond", ""]);

	if(typename _zoneArea == "OBJECT") then {
		if(isNull _zoneArea) exitWith {["Podany obszar nie istnieje"] call bis_fnc_error;};
	};
	if(typename _zoneArea == "STRING") then {
		if(_zoneArea == "") exitWith {["Podany obszar nie istnieje"] call bis_fnc_error;};
	};
	if(count _zoneTarget == 0) exitWith {["Podano nieprawidlowa grupe docelowa"] call bis_fnc_error;};

	_varName = format ["a3c_sys_deadzone_%1", _zoneArea];
	missionNamespace setVariable [_varName, true];
	_condValue = true;

	_checkingUnits = [];

	while {_condValue} do {
		_players = call CBA_fnc_players;
		{
			if([vehicle _x, _zoneArea] call CBA_fnc_inArea && alive _x) then {
				_unit = _x;
				_isType = false;
				{if(vehicle _unit isKindOf _x) exitWith {_isType = true;};} forEach _zoneTarget;

				// special condition if type is right
				if(_isType && str _zoneSpecCond != "{}") then {
					if(!(_unit call _zoneSpecCond)) then {_isType = false;}
				};

				if(_isType && !(_unit getVariable ["a3c_sys_deadzone_check",false])) then {
					_unit setVariable ["a3c_sys_deadzone_check",true];
					_checking = [_unit,_zoneArea] spawn {
						_u = _this select 0;
						_a = _this select 1;
						_counter = 0;
						for "_x" from 1 to 10 do {
							sleep 1;
							if(!([vehicle _u, _a] call CBA_fnc_inArea) || !alive _u) exitWith {};
							_counter = _counter + 1;
							if(!ismultiplayer) then {systemChat format ["Obecny w obszarze zakazanym przez %1s",_counter];};
						};
						if(_counter == 10) then {
							[_this select 0] call bis_fnc_neutralizeUnit;
						};
						_u setVariable ["a3c_sys_deadzone_check",false];
					};
				};
			};
		} forEach _players;
		sleep 0.5;
		_condValue = missionNamespace getVariable [_varName, false];
	};
};
