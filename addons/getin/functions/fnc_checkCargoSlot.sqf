/*
 * Author: SzwedzikPL
 *
 * Check cargo slot
 */
#include "script_component.hpp"

private ["_vehicle","_slotIndex","_slotFree","_slotUnit","_assigned"];
_vehicle = _this select 0;
_slotIndex = _this select 1;
_slotFree = true;
_slotUnit = objNull;
_assigned = assignedCargo _vehicle;

if(_slotIndex < 0) exitwith {[true, objnull]};

{
	_si = _vehicle getCargoIndex _x;
	if(_si == _slotIndex) then {
		_slotFree = false;
		_slotUnit = _x;
	};
} foreach _assigned;

[_slotFree,_slotUnit];