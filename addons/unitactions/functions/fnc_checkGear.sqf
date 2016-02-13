/*
 * Author: SzwedzikPL
 * Check gear of unit
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcSelectMenu.hpp"

params ["_player", "_unit"];

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_ui_selectMenu";
if(!_dialog) exitWith {};

private _unitName = _unit call EFUNC(common,getName);

//set header title
ctrlSetText [IDC_SELECTMENU_HEADER, format [localize LSTRING(CheckGear_ListHeader), _unitName]];
//hide left button
ctrlShow [IDC_SELECTMENU_BUTTON1, false];
ctrlShow [IDC_SELECTMENU_BUTTON1BG, false];
//setup right button
ctrlSetText [IDC_SELECTMENU_BUTTON2, localize ELSTRING(Common,Close)];
buttonSetAction [IDC_SELECTMENU_BUTTON2, "closeDialog 0"];

//list weapons
private _allWeapons = [];

if ((primaryWeapon _unit) != "") then {_allWeapons pushBack [primaryWeapon _unit, primaryWeaponItems _unit];};
if ((handgunWeapon _unit) != "") then {_allWeapons pushBack [handgunWeapon _unit, handgunItems _unit];};
if ((secondaryWeapon _unit) != "") then {_allWeapons pushBack [secondaryWeapon _unit, secondaryWeaponItems _unit];};

//list gear
private _allGear = [];

if (count (assignedItems _unit) > 0) then {
    _allGear append (assignedItems _unit);
};
if (count (uniformItems _unit) > 0) then {
    _allGear append (uniformItems _unit);
};
if (count (vestItems _unit) > 0) then {
    _allGear append (vestItems _unit);
};
if (count (backpackItems _unit) > 0) then {
    _allGear append (backpackItems _unit);
};

//display weapon list
{
    _x params ["_weapon", "_weaponItems"];
    private _name = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
    private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    private _weaponItemsInfo = "";

    {
        if(_x != "") then {
            if(_weaponItemsInfo == "") then {
                _weaponItemsInfo = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
            } else {
                _weaponItemsInfo = format ["%1, %2", _weaponItemsInfo, getText (configFile >> "CfgWeapons" >> _x >> "displayName")];
            };
        };
    } forEach _weaponItems;

    if(_weaponItemsInfo == "") then {_weaponItemsInfo = tolower localize ELSTRING(Common,None);};

    private _index = lbAdd [IDC_SELECTMENU_ITEMLIST, _name];
    lbSetPicture [IDC_SELECTMENU_ITEMLIST, _index, _picture];
    lbSetTooltip [IDC_SELECTMENU_ITEMLIST, _index, format [localize LSTRING(CheckGear_WeaponAddons), _weaponItemsInfo]];
} forEach _allWeapons;

//display gear list
private _listedGearClasses = [];
{
    private _item = _x;
    if(!(_item in _listedGearClasses)) then {
        _listedGearClasses pushBack _item;
        private _config = configFile;
        if(isClass (configFile >> "CfgGlasses" >> _item)) then {_config = (configFile >> "CfgGlasses" >> _item);};
        if(isClass (configFile >> "CfgMagazines" >> _item)) then {_config = (configFile >> "CfgMagazines" >> _item);};
        if(isClass (configFile >> "CfgWeapons" >> _item)) then {_config = (configFile >> "CfgWeapons" >> _item);};
        if(getText (_config >> "displayName") != "") then {
            private _name = getText (_config >> "displayName");
            private _picture = getText (_config >> "picture");
            private _count = ({_x == _item} count _allGear);
            private _index = lbAdd [IDC_SELECTMENU_ITEMLIST, format ["%1 x%2", _name, _count]];
            lbSetPicture [IDC_SELECTMENU_ITEMLIST, _index, _picture];
        };
    };
} forEach _allGear;
