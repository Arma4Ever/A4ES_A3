#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

[QGVAR(defenderBehaviour), {
  _this call FUNC(defenderBehaviour);
}] call CBA_fnc_addEventHandler;

// Remove AI NVG from inventory if player has one
["loadout", {
  // Use "player" - ignore remote controled units
  if (QGVAR(NVGoggles) in (assignedItems player)) then {
    LOG('Removing AI NVG from player');
    player unlinkItem QGVAR(NVGoggles);
  };
}] call CBA_fnc_addPlayerEventHandler;

// Add primary weapon magazine to AI on reload
["CAManBase", "Reloaded", {
  _this call FUNC(handleManReloaded);
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Prevent AI from shooting just after getting out from vehicle
["CAManBase", "GetOutMan", {
  _this call FUNC(handleGetOut);
}] call CBA_fnc_addClassEventHandler;

// Reset AI vehicle ammo on reload
{
  [_x, "Reloaded", {
    _this call FUNC(handleVehicleReloaded);
  }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach ["Car", "Tank", "Helicopter", "Plane", "Ship", "StaticWeapon"];
