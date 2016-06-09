#include "script_component.hpp"

private ["_menuDef", "_target", "_player", "_params", "_menuName", "_menuRsc", "_menus"];

_target = GVAR(fleximenuTarget);
_player = ace_player;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";
_menus = [];

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {TRACE_1("ERROR: Invalid params",_this);};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

//==============================================================================
//==============================================================================

private ["_menuTitle", "_menuActionsList", "_menuOptions"];

if (_target isKindOf "CAManBase") then {
	_menuTitle = name _target;
} else {
	_menuTitle = getText (configFile >> "CfgVehicles" >> typeof _target >> "displayName");
};

_menuActionsList = [_target, _player, GVAR(fleximenuActions), []] call FUNC(flexiMenuGetActionsFromPath);
_menuOptions = [_target, _player, _menuActionsList, []] call FUNC(flexiMenuGetOptions);

_menus pushBack [["main", _menuTitle, _menuRsc], _menuOptions];

if (_menuName != "main" && _menuName != "") then {
	private ["_submenuData", "_submenuActionsList", "_submenuOptions"];

	_submenuData = [_menuName] call FUNC(flexiMenuGetMenuData);
	_submenuData params ["_submenuTitle", "_submenuPath"];

	GVAR(fleximenuLastMenuPath) = GVAR(fleximenuMenuPath);
	GVAR(fleximenuMenuPath) = _submenuPath;

	_submenuActionsList = [_target, _player, GVAR(fleximenuActions), GVAR(fleximenuMenuPath)] call FUNC(flexiMenuGetActionsFromPath);
	_submenuOptions = [_target, _player, _submenuActionsList, GVAR(fleximenuMenuPath)] call FUNC(flexiMenuGetOptions);

	_menus pushback [[_menuName, _submenuTitle, _menuRsc, ""], _submenuOptions];

};

//==============================================================================
//==============================================================================

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef
