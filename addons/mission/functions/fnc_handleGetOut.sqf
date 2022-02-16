#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles GetOut event for all vehicles, makes sure empty vehicles have dyn sim enabled
 */

params ["_vehicle"];
TRACE_1("handleGetOut",_vehicle);

// Exit if alive crew is not empty
if (
  ((crew _vehicle) select {alive _x}) isNotEqualTo []
) exitWith {};

// Exit if air vehicle in motion
if (
  (_vehicle isKindOf "Air") &&
  {(velocity _vehicle) isNotEqualTo [0, 0, 0]}
) exitWith {};

if !(dynamicSimulationEnabled _vehicle) then {
  TRACE_1("Enabling dyn sim for empty vehicle",_vehicle);
  _vehicle enableDynamicSimulation true;
};
