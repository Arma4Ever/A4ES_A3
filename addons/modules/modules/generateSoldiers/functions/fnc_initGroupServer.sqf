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

// Add units to curators
if (_logic getVariable [QGVAR(addToCurators), false]) then {
  {
    _x addCuratorEditableObjects [_units, true];
  } forEach allCurators;
};

// Setup vars for admin
{
  _x setVariable [QGVAR(generator), _logic];
} forEach _units;
