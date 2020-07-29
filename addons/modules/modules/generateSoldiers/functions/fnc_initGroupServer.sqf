#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits generated group on server
 */

params ["_group", "_logic"];

private _units = units _group;

// Setup dynamic simulation
_group enableDynamicSimulation (!(_logic getVariable [QGVAR(disableDynamicSim), false]));

// Add units to curators
if (_logic getVariable [QGVAR(addToCurators), false]) then {
  {
    _x addCuratorEditableObjects [_units, true];
  } forEach allCurators;
};

// Setup vars for headless and admin
_group setVariable [QEGVAR(headless,disableTransfer), true];
{
  _x setVariable [QEGVAR(headless,disableTransfer), true];
  _x setVariable [QGVAR(generator), _logic];
} forEach _units;
