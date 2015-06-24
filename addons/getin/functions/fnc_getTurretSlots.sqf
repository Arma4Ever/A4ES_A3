/*
 * Author: SzwedzikPL
 *
 * Return turret slots
 */
#include "script_component.hpp"

private ["_parentClass","_parentIndex","_turretSlots","_turrets"];
_parentClass = _this select 0;
_parentIndex = _this select 1;
_turretSlots = [];
_turrets = (_parentClass) call BIS_fnc_getCfgSubClasses;
{
	private ["_turret", "_slotname", "_slotindex", "_slottype"];
	_turret = _x;
	_slotname = getText (_parentClass >> _turret >> "gunnerName");
	_slotindex = 0;
	_slottype = "turret";

	if(_parentIndex == -1) then {
		_slotindex = [_forEachIndex];
	} else {
		_slotindex = [_parentIndex,_forEachIndex];
	};

	_turretSlots pushBack [_slotname, _slotindex, _slottype];

	//Sub Turrets
	private ["_subTurretsClass","_subTurrets","_subTurretSlots"];
	_subTurretsClass = (_parentClass >> _turret >> "Turrets");
	if(isClass _subTurretsClass) then {
		_subTurrets = _subTurretsClass call BIS_fnc_getCfgSubClasses;
		if(count _subTurrets > 0) then {
			_subTurretSlots = [_subTurretsClass,_forEachIndex] call FUNC(getTurretSlots);
			if(count _subTurretSlots > 0) then {
				_turretSlots =  [_turretSlots,_subTurretSlots] call BIS_fnc_arrayPushStack;
			};
		};
	};
} forEach _turrets;

_turretSlots