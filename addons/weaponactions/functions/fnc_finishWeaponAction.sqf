/*
 * Author: SzwedzikPL
 * End of weapon action
 */
#include "script_component.hpp"

params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
_args params ["_actionClass"];

//Don't show anything if player can't interact:
if (!([ACE_player, objNull, []] call ace_common_fnc_canInteractWith)) exitWith {};

//Check action
private _weapon = currentWeapon ACE_player;
private _class = (configFile >> "CfgWeapons" >> _weapon >> "a3cs_weaponActions" >> _actionClass);
if(!isClass _class) exitWith {};

private _actionSuccess = getText (_class >> "actionSuccess");
private _actionFailure = getText (_class >> "actionFailure");
private _actionWeapon = getText (_class >> "targetWeapon");

if(_errorCode == 0) then {
    private _weaponItems = [];
    private _addItem = {};
    private _removeItem = {};

    if(_weapon == (primaryWeapon ACE_player)) then {
        _weaponItems = primaryWeaponItems ACE_player;
        _addItem = {(_this select 0) addPrimaryWeaponItem (_this select 1);};
        _removeItem = {(_this select 0) removePrimaryWeaponItem (_this select 1);};
    };
    if(_weapon == (handgunWeapon ACE_player)) then {
        _weaponItems = handgunItems ACE_player;
        _addItem = {(_this select 0) addHandgunItem (_this select 1);};
        _removeItem = {(_this select 0) removeHandgunItem (_this select 1);};
    };
    if(_weapon == (secondaryWeapon ACE_player)) then {
        _weaponItems = secondaryWeaponItems ACE_player;
        _addItem = {(_this select 0) addSecondaryWeaponItem (_this select 1);};
        _removeItem = {(_this select 0) removeSecondaryWeaponItem (_this select 1);};
    };

    private _loadedMagazine = currentMagazine ACE_player;
    private _loadedMagazineAmmo = ACE_player ammo _weapon;

    ACE_player removeWeapon _weapon;
    ACE_player addWeapon _actionWeapon;
    ACE_player selectweapon _actionWeapon;
    {[ACE_player, _x] call _addItem;nil} count _weaponItems;

    private _currentMagazine = currentMagazine ACE_player;
    private _currentMagazineAmmo = ACE_player ammo _actionWeapon;

    if(_loadedMagazine == "") then {
        if(_currentMagazine != "") then {
            [ACE_player, _currentMagazine] call _removeItem;
            ACE_player addMagazine [_currentMagazine, _currentMagazineAmmo];
        };
    } else {
        if(_currentMagazine != "") then {
            ACE_player setAmmo [_actionWeapon, _loadedMagazineAmmo];
            ACE_player addMagazine [_currentMagazine, _currentMagazineAmmo];
        } else {
            [ACE_player, _loadedMagazine] call _addItem;
            ACE_player setAmmo [_actionWeapon, _loadedMagazineAmmo];
        };
    };

    [parseText format ["<t align='center'>%1</t>", _actionSuccess], 2] call ace_common_fnc_displayTextStructured;
} else {
    [parseText format ["<t align='center'>%1</t>", _actionFailure], 2] call ace_common_fnc_displayTextStructured;
};
