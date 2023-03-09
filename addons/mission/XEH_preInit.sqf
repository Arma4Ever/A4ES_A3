#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

["a4es_missionStart", {
  if !(hasInterface) exitWith {};

  // Lock player weapon
  [player, currentWeapon player, true] call ACEFUNC(safemode,setWeaponSafety);

  [{
    // Lower player weapon
    if !(weaponLowered player) then {
      player action ["WeaponOnBack", player];
    };
  }, [], 0.1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

// Disable RHS Engine startup script
RHS_ENGINE_STARTUP_OFF = true;

if (hasInterface) then {
  // Add fix invisible gear pause menu option
  [[LLSTRING(fixInvisibleGear), LLSTRING(fixInvisibleGear_Tooltip)], QGVAR(invisibleGearFix)] call CBA_fnc_addPauseMenuOption;
  GVAR(fixingInvisibleGear) = false;
};

if (isServer) then {
  {
    [_x, "GetOut", {
      [{
        _this call FUNC(handleGetOut);
      }, _this] call CBA_fnc_execNextFrame;
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  } forEach ["Plane", "Helicopter", "Car", "Tank", "Ship", "StaticWeapon"];
};

ADDON = true;
