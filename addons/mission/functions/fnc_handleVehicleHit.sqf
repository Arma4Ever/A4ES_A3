#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles hit event for all vehicles, makes sure disabled vehicles have dyn sim enabled
 */

params ["_vehicle"];
TRACE_1("handleVehicleHit",_vehicle);

[{
  params ["_vehicle"];

  // Exit if alive crew is not empty
  if (
    ((crew _vehicle) select {alive _x}) isNotEqualTo []
  ) exitWith {};

  TRACE_1("Enabling dyn sim for empty vehicle",_vehicle);
  [QEGVAR(common,enableDynSim), [_vehicle]] call CBA_fnc_serverEvent;
}, [_vehicle]] call CBA_fnc_execNextFrame;
