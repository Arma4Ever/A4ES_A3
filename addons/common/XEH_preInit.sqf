#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

GVAR(lastFunctionErrorFade) = scriptNull;

// Check if mission is a main menu
GVAR(isMainMenu) = !is3DEN && !is3DENPreview && !is3DENMultiplayer && !isMultiplayer && !isMultiplayerSolo;
if (GVAR(isMainMenu)) then {
  INFO("Main menu intro detected");
};
