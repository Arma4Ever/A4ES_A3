#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles reloaded event for vehicles
 */

params ["_vehicle"];
TRACE_1("handleVehicleReloaded",_vehicle);

// Exit if vehicle not local or player in vehicle
if (
  !(local _vehicle) ||
  {isPlayer _vehicle} ||
  {((crew _vehicle) arrayIntersect playableUnits) isNotEqualTo []}
) exitWith {};
// Reset vehicle ammo
TRACE_1('Resetting vehicle ammo',_vehicle);
_vehicle setVehicleAmmo 1;
