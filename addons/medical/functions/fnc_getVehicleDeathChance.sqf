#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns crewman death chance of given vehicle based on vehicle type
 */

params ["_vehicle"];
TRACE_1("getVehicleDeathChance",_vehicle);

if (
  (_vehicle isKindOf "StaticWeapon") ||
  {_vehicle isKindOf "Motorcycle"} ||
  {_vehicle isKindOf "Ship"}
) exitWith {0};

private _chance = switch true do {
  case (_vehicle isKindOf "Wheeled_APC_F"): {0.2};
  case (_vehicle isKindOf "Truck_F"): {0.35};
  case (_vehicle isKindOf "Car"): {0.3};
  case (_vehicle isKindOf "Tank"): {0.25};
  case (_vehicle isKindOf "Helicopter"): {0.25};
  case (_vehicle isKindOf "Plane"): {0.5};
  default {0};
};

private _config = configOf _vehicle;

if (((getNumber (_config >> "transportFuel")) max ([_vehicle] call ace_refuel_fnc_getFuel)) > 0) then {
  _chance = _chance + 0.2;
};

if (((getNumber (_config >> "transportAmmo")) max ([_vehicle] call ace_rearm_fnc_getSupplyCount)) > 0) then {
  _chance = _chance + 0.2;
};

_chance
