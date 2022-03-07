#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles GetOut event for all vehicles, makes sure empty vehicles have dyn sim enabled
 */

params ["_vehicle"];
TRACE_1("handleGetOut",_vehicle);

// Exit if alive crew
if (
  ((crew _vehicle) select {alive _x}) isNotEqualTo []
) exitWith {};

// Disable dyn sim for air vehicles in motion above ground
if (
  (_vehicle isKindOf "Air") &&
  {((getPosATL _vehicle) # 2) > 3} &&
  {(velocity _vehicle) isNotEqualTo [0, 0, 0]}
) exitWith {
  _vehicle enableDynamicSimulation false;
};

if !(dynamicSimulationEnabled _vehicle) then {
  TRACE_1("Enabling dyn sim for empty vehicle",_vehicle);
  _vehicle enableDynamicSimulation true;
};
