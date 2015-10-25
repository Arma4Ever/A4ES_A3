/*
	Autor: SzwedzikPL
	Opis: Dodane do skrzynki itemy
*/
#include "script_component.hpp"

if(!isServer) exitWith {};
private ["_box","_items"];

_box = _this select 0;
_items = _this select 1;

{

	_itemClass = _x select 0;
	_itemCount = _x select 1;
	_itemInfo = [_itemClass] call BIS_fnc_itemType;
	_itemCategory = _itemInfo select 0;

	//Broń
	if(_itemCategory == "Weapon") then {
		_box addWeaponCargoGlobal [_itemClass,_itemCount];
	};

	//Magazynki
	if(_itemCategory == "Magazine") then {
		_box addMagazineCargoGlobal [_itemClass,_itemCount];
	};
	//Itemy/Plecaki
	if(_itemCategory == "Equipment" || _itemCategory == "Item") then {
		_itemType = _itemInfo select 1;
		if(_itemCategory == "Equipment" && _itemType == "Backpack") then {
			_box addBackpackCargoGlobal [_itemClass,_itemCount];
		} else {
			_box addItemCargoGlobal [_itemClass,_itemCount];
		};
	};
} forEach _items;
