#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

// Allow crew in immobile vehicles in ~50% cases
["LandVehicle", "InitPost", {
  (_this # 0) allowCrewInImmobile ((random 1) < 0.5);
}] call CBA_fnc_addClassEventHandler;

// Add primary weapon magazine to AI on reload
["CAManBase", "Reloaded", {
  params ["_unit", "_weapon", "_muzzle", "_newMagazine"];

  // Exit if unit not local, is player or not fired from correct (main) muzzle
  if (!(local _unit) || {isPlayer _unit} || {_muzzle isNotEqualTo _weapon}) exitWith {};
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
    // Exit if vehicle not local or player is commander
    if (!(local _vehicle) || {isPlayer _vehicle}) exitWith {};
    // Reset vehicle ammo
    _vehicle setVehicleAmmo 1;
  }] call CBA_fnc_addClassEventHandler;
} forEach ["Air", "Car", "Tank", "Ship"];
