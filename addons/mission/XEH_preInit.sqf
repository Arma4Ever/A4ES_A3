#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(enableSafety), {
  // Lower player weapon
  player action ["WeaponOnBack", player];

  [{
    // Lock player weapon
    [player, currentWeapon player, true] call ACEFUNC(safemode,setWeaponSafety);
  }, [], 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

ADDON = true;

if (hasInterface) then {
  // Add fix invisible gear pause menu option
  [[localize LSTRING(fixInvisibleGear), localize LSTRING(fixInvisibleGear_Tooltip)], QGVAR(invisibleGearFix)] call CBA_fnc_addPauseMenuOption;
  GVAR(fixingInvisibleGear) = false;
};
