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
  {_unit getVariable [QEGVAR(common,isPlayer), false]} ||
  {_muzzle isNotEqualTo _weapon} ||
  {_weapon in ["Throw", "Put"]}
) exitWith {};

// Add magazine for unit primary weapon
if (_weapon isEqualTo (primaryWeapon _unit)) then {
  TRACE_2('Adding new magazine to unit',_newMagazine,_unit);
  _unit addMagazine (_newMagazine # 0);
};
