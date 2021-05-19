#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits generated group on server
 */

params ["_group", "_logic"];

private _units = units _group;

// Setup dynamic simulation
if !(_logic getVariable [QGVAR(disableDynamicSim), false]) then {
  _group enableDynamicSimulation true;
};
