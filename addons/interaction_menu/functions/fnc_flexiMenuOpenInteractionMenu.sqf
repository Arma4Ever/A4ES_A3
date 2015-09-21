#include "script_component.hpp"

params ["_dataIndex"];
private "_menuData";

_menuData = GVAR(fleximenuInteractionOptionsData) select _dataIndex;
_menuData params ["_target", "_menuActions"];

//store ace data
GVAR(fleximenuTarget) = _target;
GVAR(fleximenuType) = ace_interact_menu_openedMenuType;
GVAR(fleximenuActions) = _menuActions;
GVAR(fleximenuFirstRun) = true;
GVAR(fleximenuOptionsData) = [];

GVAR(fleximenuInteractionOptionsData) = [];

//close ace menu
ace_interact_menu_actionSelected = false;
[ace_interact_menu_openedMenuType, false] call ace_interact_menu_fnc_keyUp;

//open menu
GVAR(fleximenuDef) call cba_fnc_fleximenu_openMenuByDef;