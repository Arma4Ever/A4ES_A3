#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles reloaded event for inf units
 */

params ["_unit", "_weapon", "_muzzle", "_newMagazine"];
TRACE_4('handleManReloaded',_unit,_weapon,_muzzle,_newMagazine);

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
  TRACE_2('Adding new magazine to unit',_newMagazine,_unit);
  _unit addMagazine (_newMagazine # 0);
};
