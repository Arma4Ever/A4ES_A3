#include "\z\ace\addons\interact_menu\script_component.hpp"

ADDON = false;

PREP(addActionToClass);
PREP(addActionToObject);
PREP(addMainAction);
PREP(compileMenu);
PREP(compileMenuSelfAction);
PREP(compileMenuZeus);
PREP(collectActiveActionTree);
PREP(createAction);
PREP(ctrlSetParsedTextCached);
PREP(findActionNode);
PREP(handlePlayerChanged);
PREP(isSubPath);
DFUNC(keyDown) = compileFinal preProcessFileLineNumbers "\z\a3cs\addons\interact_menu\functions\fnc_keyDown.sqf";//PREP(keyDown);
DFUNC(keyUp) = compileFinal preProcessFileLineNumbers "\z\a3cs\addons\interact_menu\functions\fnc_keyUp.sqf";//PREP(keyUp);
PREP(removeActionFromClass);
PREP(removeActionFromObject);
PREP(render);
DFUNC(renderActionPoints) = compileFinal preProcessFileLineNumbers "\z\a3cs\addons\interact_menu\functions\fnc_renderActionPoints.sqf";//PREP(renderActionPoints);
DFUNC(renderBaseMenu) = compileFinal preProcessFileLineNumbers "\z\a3cs\addons\interact_menu\functions\fnc_renderBaseMenu.sqf";//PREP(renderBaseMenu);
PREP(renderIcon);
DFUNC(renderMenu) = compileFinal preProcessFileLineNumbers "\z\a3cs\addons\interact_menu\functions\fnc_renderMenu.sqf";//PREP(renderMenu);
PREP(renderSelector);
PREP(setupTextColors);
PREP(splitPath);
PREP(userActions_addHouseActions);
PREP(userActions_getHouseActions);

// Event handlers for all interact menu controls
DFUNC(handleMouseMovement) = {
    if (GVAR(cursorKeepCentered)) then {
        GVAR(cursorPos) = GVAR(cursorPos) vectorAdd [_this select 1, _this select 2, 0] vectorDiff [0.5, 0.5, 0];
        setMousePosition [0.5, 0.5];
    } else {
        GVAR(cursorPos) = [_this select 1, _this select 2, 0];
    };
};
DFUNC(handleMouseButtonDown) = {
    if !(GVAR(actionOnKeyRelease)) then {
        [GVAR(openedMenuType),true] call FUNC(keyUp);
    };
};

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(keyDownTime) = 0;
GVAR(openedMenuType) = -1;

GVAR(lastTime) = ACE_diagTime;
GVAR(rotationAngle) = 0;

GVAR(selectedAction) = [[],[]];
GVAR(actionSelected) = false;
GVAR(selectedTarget) = objNull;

GVAR(menuDepthPath) = [];
GVAR(lastPos) = [0,0,0];

GVAR(currentOptions) = [];

GVAR(lastPath) = [];

GVAR(expanded) = false;

GVAR(startHoverTime) = ACE_diagTime;
GVAR(expandedTime) = ACE_diagTime;
GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

GVAR(collectedActionPoints) = [];
GVAR(foundActions) = [];
GVAR(lastTimeSearchedActions) = -1000;

//--- EDIT
GVAR(firstCursorTarget) = objNull;
GVAR(firstCursorTargetPos) = [0,0,0];
//--- EDIT

// Init zeus menu
[] call FUNC(compileMenuZeus);

ADDON = true;
