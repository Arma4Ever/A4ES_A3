#include "script_component.hpp"

[QGVAR(thrownInGrenadeExplosion), {
  params ["_target"];

  _target setHitPointDamage ["hitEngine", 1];
  _target setHitPointDamage ["hitTurret", 1];
  _target setHitPointDamage ["hitGun", 1];
}] call CBA_fnc_addEventHandler;

if !(hasInterface) exitWith {};

[QGVAR(knockingInHatch), {
  params ["_target"];

  // Exit if player is not inside target vehicle
  if ((objectParent ace_player) isNotEqualTo _target) exitWith {};

  playSound QGVAR(knockingOnHatch);
  [localize LSTRING(KnockingInHatch), 2] call ACEFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;
