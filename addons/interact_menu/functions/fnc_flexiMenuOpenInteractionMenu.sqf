#include "script_component.hpp"

params ["_target", "_player", "_menuActions"];

//store ace data
GVAR(fleximenuTarget) = _target;
GVAR(fleximenuType) = ace_interact_menu_openedMenuType;
GVAR(fleximenuActions) = _menuActions;
GVAR(fleximenuFirstRun) = true;
GVAR(fleximenuOptionsData) = [];

//close ace menu
//ace_interact_menu_actionSelected = false;
//[ace_interact_menu_openedMenuType, false] call ace_interact_menu_fnc_keyUp;

//open menu
GVAR(fleximenuDef) call cba_fnc_fleximenu_openMenuByDef;
