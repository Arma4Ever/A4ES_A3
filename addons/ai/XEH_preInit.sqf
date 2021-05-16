#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

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
  params ["_unit", "_weapon", "_muzzle", "_newMagazine"];

  // Exit if unit not local, is player or not fired from correct (main) muzzle
  if (
    !(local _unit) ||
    {isPlayer _unit} ||
    {_muzzle isNotEqualTo _weapon} ||
    {_unit in playableUnits}
  ) exitWith {};
  // Exit if thrown grenade or put mine
  if (_weapon in ["Throw", "Put"]) exitWith {};

  // Add magazine for unit primary weapon
  if (_weapon isEqualTo (primaryWeapon _unit)) then {
    LOG_2('Adding "%1" magazine for "%2" unit',_newMagazine # 0,str _unit);
    _unit addMagazine (_newMagazine # 0);
  };
}] call CBA_fnc_addClassEventHandler;

// Reset AI vehicle ammo on reload
{
  [_x, "Reloaded", {
    params ["_vehicle"];
    // Exit if vehicle not local or player in vehicle
    if (
      !(local _vehicle) ||
      {isPlayer _vehicle} ||
      {((crew _vehicle) arrayIntersect playableUnits) isNotEqualTo []}
    ) exitWith {};
    // Reset vehicle ammo
    _vehicle setVehicleAmmo 1;
  }] call CBA_fnc_addClassEventHandler;
} forEach ["Air", "Car", "Tank", "Ship", "StaticWeapon"];
