#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks unit gear
 */

params ["_target"];
TRACE_1("checkGear",_target);

private _display = createDialog [QGVAR(unitGear), true];

private _tab = _display displayCtrl 1002;
private _list = _display displayCtrl 1003;

_tab ctrlSetText (_target call EFUNC(common,getUnitName));

private _itemsMap = createHashMap;
private _itemsOrderList = [];

private _weapons = weapons _target;

{
	private _list = _x;
	{
		_itemsMap set [_x, (_itemsMap getOrDefault [_x, 0]) + 1];
		_itemsOrderList pushBackUnique _x;
	} forEach _list;
} forEach [
	[
		uniform _target,
		vest _target,
		backpack _target
	],
	_weapons,
	assignedItems _target,
	// Remove weapons from items list to avoid duplicates if some weapon
	// is stored inside uniform, vest or backpack
	(itemsWithMagazines _target) - _weapons
];

private _cfgWeapons = (configFile >> "CfgWeapons");
private _cfgMagazines = (configFile >> "CfgMagazines");
private _cfgVehicles = (configFile >> "CfgVehicles");

{
	private _config = (_cfgWeapons >> _x);

	if !(isClass _config) then {
		_config = (_cfgMagazines >> _x);
		if !(isClass _config) then {
			_config = (_cfgVehicles >> _x);
		};
	};

	_list lbAdd (getText (_config >> "displayName"));
	_list lbSetPicture [_forEachIndex, getText (_config >> "picture")];
	_list lbSetTooltip [_forEachIndex, getText (_config >> "descriptionShort")];
	_list lbSetTextRight [_forEachIndex, str (_itemsMap getOrDefault [_x, 1])];
} forEach _itemsOrderList;