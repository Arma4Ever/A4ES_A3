/*
 * Author: SzwedzikPL
 * Check gear of unit
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcListBox.hpp"

params ["_player", "_unit"];

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_ui_listBox";
if(!_dialog) exitWith {};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_ui_listBox", displayNull];
if(isNull _display) exitWith {};

private _unitName = _unit call EFUNC(common,getName);

if(isPlayer _unit && {!(_player isEqualTo _unit)}) then {
    private _playerName = _player call EFUNC(common,getName);
    private _hintText = format [localize LSTRING(CheckGear_Notification), _playerName];
    _hintText remoteExecCall ["hint", _unit];
};

//set header title
(_display displayCtrl IDC_LISTBOX_HEADER) ctrlSetText format [localize LSTRING(CheckGear_ListHeader), _unitName];
//setup close button
(_display displayCtrl IDC_LISTBOX_BUTTON3) ctrlSetText localize ELSTRING(Common,Close);
(_display displayCtrl IDC_LISTBOX_BUTTON3) buttonSetAction "closeDialog 0";
//hide 2 buttons
(_display displayCtrl IDC_LISTBOX_BUTTON1) ctrlShow false;
(_display displayCtrl IDC_LISTBOX_BUTTON2) ctrlShow false;

//list weapons
private _allWeapons = [];

if ((primaryWeapon _unit) != "") then {_allWeapons pushBack (primaryWeapon _unit);};
if ((handgunWeapon _unit) != "") then {_allWeapons pushBack (handgunWeapon _unit);};
if ((secondaryWeapon _unit) != "") then {_allWeapons pushBack (secondaryWeapon _unit);};

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

private _controlList = _display displayCtrl IDC_LISTBOX_LIST;
private _listCol = _controlList lnbAddColumn 0.6;

//display weapon list
{
    _x params ["_weapon"];
    private _index = -1;
    private _name = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
    private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");

    _index = _controlList lnbAddRow [_name, ""];
    _controlList lnbSetPicture [[_index, 0], _picture];
} forEach _allWeapons;

//display gear list
private _listedGearClasses = [];
{
    private _item = _x;
    private _index = -1;
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
            _index = _controlList lnbAddRow [_name, format ["x%1", _count]];
            _controlList lnbSetPicture [[_index, 0], _picture];
        };
    };
} forEach _allGear;
