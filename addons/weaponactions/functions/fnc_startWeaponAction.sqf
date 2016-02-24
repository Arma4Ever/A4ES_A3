/*
 * Author: SzwedzikPL
 * Init weapon action
 */
#include "script_component.hpp"

params ["_target", "_player", "_actionClass"];

//Check action
private _weapon = currentWeapon ACE_player;
private _class = (configFile >> "CfgWeapons" >> _weapon >> "a3cs_weaponActions" >> _actionClass);

if(!isClass _class) exitWith {};

private _actionName = getText (_class >> "actionName");
private _actionTime = getNumber (_class >> "actionTime");
private _actionProgressTitle = getText (_class >> "actionProgress");
private _actionWeapon = getText (_class >> "targetWeapon");
private _actionUnloadMagazine = (getNumber (_class >> "unloadMagazine")) == 1;

if(_actionWeapon == "") exitWith {};
if(_actionUnloadMagazine && (currentMagazine ACE_player) != "") exitWith {
    [parseText format ["<t align='center'>%1</t>", (localize LSTRING(UnloadMagazine))], 2] call ace_common_fnc_displayTextStructured;
};

//Check canInteractWith
if (!([ACE_player, objNull, []] call ace_common_fnc_canInteractWith)) exitWith {};

//Do anim
[ACE_player] call ace_common_fnc_goKneeling;

//Start action
[
    _actionTime,
    [_actionClass],
    {_this call FUNC(finishWeaponAction)},
    {_this call FUNC(finishWeaponAction)},
    _actionProgressTitle,
    {true},
    []
] call ace_common_fnc_progressBar;
