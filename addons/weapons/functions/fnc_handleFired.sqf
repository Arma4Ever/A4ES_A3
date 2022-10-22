#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles fired event for ACE advanced ballistics
 */

params ["_unit", "_weapon", "", "", "_ammo", "", "_projectile"];
TRACE_4("handleFired",_unit,_weapon,_ammo,_projectile);

if (
  !(_unit getVariable [QGVAR(advBallEnabled), false]) ||
  {!alive _projectile} ||
  {_ammo isKindOf "BulletBase"} ||
  {underwater _unit}
) exitWith {};

_this call ace_advanced_ballistics_fnc_handleFired;

// Dodac blackliste karabinow
