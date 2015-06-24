/*
 * Author: SzwedzikPL
 *
 * Return vehicle slots
 */
#include "script_component.hpp"

private ["_vehicle","_class","_vehicleSlots","_mainTurretsClass","_mainTurrets","_turretSlots","_transportSoldier"];
_vehicle = _this select 0;
_class = typeOf _vehicle;
_vehicleSlots = [];

//Driver
if(getNumber (configfile >> "CfgVehicles" >> _class >> "hasDriver") == 1) then {
	_vehicleSlots pushBack ["driver", -1, "driver"];
};

//Turrets
_mainTurretsClass = (configfile >> "CfgVehicles" >> _class >> "Turrets");
if(isClass _mainTurretsClass) then {
	_mainTurrets = _mainTurretsClass call BIS_fnc_getCfgSubClasses;
	if(count _mainTurrets > 0) then {
		_turretSlots = [_mainTurretsClass,-1] call FUNC(getTurretSlots);
		if(count _turretSlots > 0) then {
			_vehicleSlots = [_vehicleSlots,_turretSlots] call BIS_fnc_arrayPushStack;
		};
	};
};

_vehicleSlots