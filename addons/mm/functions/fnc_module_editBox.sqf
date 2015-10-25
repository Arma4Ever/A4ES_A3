/*
	Author: SzwedzikPL
	Desc: Module editbox fnc
*/
#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!isServer) exitWith {};

if (_activated) then {

	_items = call compile (_logic getvariable ["contentcode","[]"]);
	_clearBefore = _logic getvariable ["clearbefore",true];

	if(count _items == 0) exitWith {};

	{
		_box = _x;

		if (isNull _box) exitWith {["Podana skrzynia nie istnieje"] call bis_fnc_error;};

		if(_clearBefore) then {
			clearBackpackCargoGlobal _box;
			clearItemCargoGlobal _box;
			clearMagazineCargoGlobal _box;
			clearWeaponCargoGlobal _box;
		};
		[_box,_items] call FUNC(addBoxItems);
	} foreach _units;
};

true
