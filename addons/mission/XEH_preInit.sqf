#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if (hasInterface) then {
  // Add fix invisible gear pause menu option
  [[localize LSTRING(fixInvisibleGear), localize LSTRING(fixInvisibleGear_Tooltip)], QGVAR(invisibleGearFix)] call CBA_fnc_addPauseMenuOption;
  GVAR(fixingInvisibleGear) = false;
};
