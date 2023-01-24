#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles entityKilled for medical addon
 */
params ["_entity"];
TRACE_1("handleEntityKilled",_entity);

if (
  (isNull _entity) ||
  {(objectParent player) isNotEqualTo _entity} ||
  {_entity isEqualTo player}
) exitWith {};

// Apply extra vehicle explosion damage
if !(
  !(alive player) ||
  {_entity isKindOf "StaticWeapon"} ||
  {_entity isKindOf "Motorcycle"} ||
  {_entity isKindOf "Ship"}
) then {
  private _count = 1 + (floor (random 5));
  TRACE_3("Applying vehicle explosion damage",player,_entity,_count);

  for "_x" from 1 to _count do {
    private _dmg = 1 + (random 15.5);
    TRACE_2("Applying damage",_x,_dmg);
    [player, _dmg, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;
  };
};

/*
private _deathChance = _entity call FUNC(getVehicleDeathChance);

// Death in vehicle explosion
if (
  (_deathChance > 0) &&
  {_deathChance >= (random 1)}
) exitWith {
  TRACE_4("Death in explosion",player,_entity,typeOf _entity,_deathChance);
  [
    player,
    "#vehicleExplosion",
    player getVariable ["ace_medical_lastInstigator", player]
  ] call ace_medical_status_fnc_setDead;
};
*/

// Init ejection of player (if alive)
[player, _entity] spawn FUNC(startEjectPlayerFromWreck);
