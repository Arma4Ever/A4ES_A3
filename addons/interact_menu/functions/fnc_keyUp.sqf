/*
 * Author: NouberNou and esteldunedain
 * Handle interactions key up
 *
 * Argument:
 * 0: Type of key: 0 interaction / 1 self interaction <NUMBER>
 *
 * Return value:
 * true <BOOL>
 *
 * Public: No
 */
#include "\z\ace\addons\interact_menu\script_component.hpp"

params ["_menuType", "_calledByClicking"];

// Exit if there's no menu opened
if (GVAR(openedMenuType) < 0) exitWith {true};

if (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
    (findDisplay 91919) closeDisplay 2;
};

if(GVAR(actionSelected)) then {
    this = GVAR(selectedTarget);

    private _player = ACE_Player;
    private _target = GVAR(selectedTarget);

    // Clear the conditions caches
    [QGVAR(clearConditionCaches), []] call CBA_fnc_localEvent;

    // exit scope if selecting an action on key release is disabled
    if (!(GVAR(actionOnKeyRelease)) && !_calledByClicking) exitWith {};

    // Check the action conditions
    private _actionData = GVAR(selectedAction) select 0;
    if ([_target, _player, _actionData select 6] call (_actionData select 4)) then {
        // Call the statement
        [_target, _player, _actionData select 6] call (_actionData select 3);

        // Clear the conditions caches again if the action was performed
        [QGVAR(clearConditionCaches), []] call CBA_fnc_localEvent;
    };
};

["ace_interactMenuClosed", [GVAR(openedMenuType)]] call CBA_fnc_localEvent;

//--- EDIT
if (a3cs_interact_menu_useFlexiMenu) then {
    [{
        params ["_args", "_pfID"];
        if (!dialog) then {
            GVAR(keyDown) = false;
            GVAR(keyDownSelfAction) = false;
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.05, []] call CBA_fnc_addPerFrameHandler;
} else {
    GVAR(keyDown) = false;
    GVAR(keyDownSelfAction) = false;
};
//--- EDIT

//GVAR(keyDown) = false; //--- EDIT
//GVAR(keyDownSelfAction) = false; //--- EDIT
GVAR(openedMenuType) = -1;

GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];

true
