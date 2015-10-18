#include "script_component.hpp"

params ["_player", "_unit"];
private ["_dialog", "_dialogMenu", "_unitName", "_allWeapons", "_allGear"];

while {dialog} do {closeDialog 0;};

_dialog = createDialog QGVAR(select_menu);
if(!_dialog) exitWith {};

_dialogMenu = 8866;
_unitName = _unit getVariable ["ACE_Name", name _unit];

ctrlSetText [8870, format [localize "STR_A3CS_Nametag_checkGear_header", _unitName]];
ctrlSetText [8860, localize "STR_A3CS_Nametag_close"];

//list weapons
_allWeapons = [];

if ((primaryWeapon _unit) != "") then {_allWeapons pushBack [primaryWeapon _unit, primaryWeaponItems _unit];};
if ((handgunWeapon _unit) != "") then {_allWeapons pushBack [handgunWeapon _unit, handgunItems _unit];};
if ((secondaryWeapon _unit) != "") then {_allWeapons pushBack [secondaryWeapon _unit, secondaryWeaponItems _unit];};

//list gear
_allGear = [];

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
    private ["_name", "_picture", "_weaponItemsInfo", "_index"];
    _x params ["_weapon", "_weaponItems"];
    _name = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    _weaponItemsInfo = "";

    {
        if(_x != "") then {
            if(_weaponItemsInfo == "") then {
                _weaponItemsInfo = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
            } else {
                _weaponItemsInfo = format ["%1, %2", _weaponItemsInfo, getText (configFile >> "CfgWeapons" >> _x >> "displayName")];
            };
        };
        nil
    } count _weaponItems;

    if(_weaponItemsInfo == "") then {_weaponItemsInfo = "brak";};

    _index = lbAdd [_dialogMenu, _name];
    lbSetPicture [_dialogMenu, _index, _picture];
    lbSetTooltip [_dialogMenu, _index, format [localize "STR_A3CS_Nametag_checkGear_addons", _weaponItemsInfo]];
    nil
} count _allWeapons;

//display gear list
_listedGearClasses = [];
{
    private ["_item", "_config", "_name", "_picture", "_count", "_index"];
    _item = _x;
    if(!(_item in _listedGearClasses)) then {
        _listedGearClasses pushBack _item;
        _config = configFile;
        if(isClass (configFile >> "CfgGlasses" >> _item)) then {_config = (configFile >> "CfgGlasses" >> _item);};
        if(isClass (configFile >> "CfgMagazines" >> _item)) then {_config = (configFile >> "CfgMagazines" >> _item);};
        if(isClass (configFile >> "CfgWeapons" >> _item)) then {_config = (configFile >> "CfgWeapons" >> _item);};
        if(getText (_config >> "displayName") != "") then {
            _name = getText (_config >> "displayName");
            _picture = getText (_config >> "picture");
            _count = ({_x == _item} count _allGear);
            _index = lbAdd [_dialogMenu, format ["%1 x%2", _name, _count]];
            lbSetPicture [_dialogMenu, _index, _picture];
        };
    };
    nil
} count _allGear;
