#include "script_component.hpp"

params ["_target", "_player", "_menuActions"];

_flexiMenuActions = +_menuActions;

private _objectActions = [];
{
    _x params ["_action", "_children"];
    if (count _children == 1 && (_children select 0) == "ACE_MainActions") then {
        _children = [];
    };
    _objectActions pushback [_action, _children];
} forEach (_target getVariable ["ace_interact_menu_actions", []]);
_flexiMenuActions append _objectActions;

//store ace data
GVAR(fleximenuTarget) = _target;
GVAR(fleximenuType) = ace_interact_menu_openedMenuType;
GVAR(fleximenuActions) = _flexiMenuActions;
GVAR(fleximenuFirstRun) = true;
GVAR(fleximenuOptionsData) = [];

//close ace menu
//ace_interact_menu_actionSelected = false;
//[ace_interact_menu_openedMenuType, false] call ace_interact_menu_fnc_keyUp;

//open menu
GVAR(fleximenuDef) call cba_fnc_fleximenu_openMenuByDef;
