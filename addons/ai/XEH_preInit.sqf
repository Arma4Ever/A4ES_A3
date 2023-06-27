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

// Make AI hide from fire
["CAManBase", "InitPost", {
  params ["_unit"];

  _unit addEventHandler ["Suppressed", {
    params ["_unit"];
    if (
      !(local _unit) ||
      {!(_unit checkAIFeature "PATH")} ||
      {!(_unit checkAIFeature "AUTOCOMBAT")} ||
      {!(_unit checkAIFeature "SUPPRESSION")} ||
      {!(isNull (objectParent _unit))} ||
      {(currentWeapon _unit) == ""}
    ) exitWith {};
    TRACE_1("ai suppressed",_unit);

    if ((unitPos _unit) != "down") then {
      if ((random 1) > 0.4) exitWith {};
      _unit setUnitPos "DOWN";
      _unit spawn {
        sleep (2 + (random 4));
        _this setUnitPos "AUTO";
      };
    };
  }];
}] call CBA_fnc_addClassEventHandler;

// Reset AI vehicle ammo on reload
{
  [_x, "Reloaded", {
    _this call FUNC(handleVehicleReloaded);
  }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach ["Car", "Tank", "Helicopter", "Plane", "Ship", "StaticWeapon"];
