#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

if (hasInterface) then {
  // Add fix invisible gear pause menu option
  [[localize LSTRING(fixInvisibleGear), localize LSTRING(fixInvisibleGear_Tooltip)], QGVAR(invisibleGearFix)] call CBA_fnc_addPauseMenuOption;
  GVAR(fixingInvisibleGear) = false;
};
