#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

// Check if mission is a main menu intro
GVAR(isMainMenu) = allDisplays isEqualTo [findDisplay 0];
if (GVAR(isMainMenu)) then {
  INFO("Main menu intro detected");
};
