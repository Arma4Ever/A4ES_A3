#include "script_component.hpp"

ace_interact_menu_fnc_renderActionPoints = compile preProcessFileLineNumbers "\z\a3cs\addons\interaction_menu\functions\fnc_renderActionPoints.sqf";
ace_interact_menu_fnc_renderMenu = compile preProcessFileLineNumbers "\z\a3cs\addons\interaction_menu\functions\fnc_renderMenu.sqf";

GVAR(fleximenuDef) call cba_fnc_flexiMenu_add;

["interactMenuOpened", {
    if(GVAR(useFlexiMenu)) then {
        if(ace_interact_menu_openedMenuType == 1 || vehicle ace_player != ace_player) then {
        	//collect ace actions
            call ace_interact_menu_fnc_renderActionPoints;

            //store ace data
            GVAR(fleximenuTarget) = if(ace_interact_menu_openedMenuType == 1) then {ace_player} else {vehicle ace_player};
            GVAR(fleximenuType) = ace_interact_menu_openedMenuType;
            GVAR(fleximenuActions) = ace_interact_menu_collectedActionPoints;
            GVAR(fleximenuFirstRun) = true;
            GVAR(fleximenuOptionsData) = [];

            //close ace menu
            ace_interact_menu_actionSelected = false;
            [ace_interact_menu_openedMenuType, false] call ace_interact_menu_fnc_keyUp;

            //open menu
            GVAR(fleximenuDef) call cba_fnc_fleximenu_openMenuByDef;
        };
    };
}] call ace_common_fnc_addEventHandler;