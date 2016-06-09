/*
 * Author: SzwedzikPL
 * Return interact menu weapon actions children
 */
#include "script_component.hpp"

//params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]]];

//Check action
private _weapon = currentWeapon ACE_player;
private _class = (configFile >> "CfgWeapons" >> _weapon >> "a3cs_weaponActions");

if (!isClass _class) exitWith {[]};

private _weaponActions = "true" configClasses _class;
private _actions = [];
{
    private _actionClass = configName _x;
    private _displayName = getText (_class >> _actionClass >> "actionName");
    private _action = [_actionClass, _displayName, "", {_this call FUNC(startWeaponAction)}, {true}, {}, _actionClass] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], ACE_player];
} foreach _weaponActions;

_actions
