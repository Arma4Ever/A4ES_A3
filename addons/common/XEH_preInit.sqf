#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

GVAR(lastFunctionErrorFade) = scriptNull;

// Check if mission is a main menu intro
// TODO: different method - this won't work in returns to main-menu for some dialogs
GVAR(isMainMenu) = allDisplays isEqualTo [findDisplay 0];
if (GVAR(isMainMenu)) then {
  INFO("Main menu intro detected");
};
