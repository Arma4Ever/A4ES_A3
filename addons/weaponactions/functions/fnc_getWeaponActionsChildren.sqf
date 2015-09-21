#include "script_component.hpp"

private ["_weapon", "_class"];

params ["_target", "_player"];

//Check action
_weapon = currentWeapon ACE_player;
_class = (configFile >> "CfgWeapons" >> _weapon >> "a3cs_weaponActions");

if(!isClass _class) exitWith {[]};

private ["_weaponActions", "_actions"];

_weaponActions = "true" configClasses _class;
_actions = [];

{
	private ["_actionClass", "_displayName", "_action"];

	_actionClass = configName _x;
	_displayName = getText (_class >> _actionClass >> "actionName");

	_action = [_actionClass, _displayName, "", {_this call FUNC(startWeaponAction)}, {true}, {}, _actionClass] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], ACE_player];
} foreach _weaponActions;

_actions