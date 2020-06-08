#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Updates entity dynamic simulation 3DEN attribute
 */

params ["_entity"];

private _target = _entity;

// Get unit group
if (_target isEqualType objNull) then {
  _target = group _entity;
};

// Exit if group is null
if (isNull _target) exitWith {};

// Get dynamicSimulation attribute value
private _dynamicSim = false;
private _dynamicSimAttr = _target get3DENAttribute "dynamicSimulation";
if !(_dynamicSimAttr isEqualTo []) then {
  _dynamicSim = _dynamicSimAttr # 0;
};

// Get disableDynamicSimulation attribute value
private _disableDynamicSim = false;
private _disableDynamicSimAttr = _target get3DENAttribute QGVAR(disableDynamicSimulation);
if !(_disableDynamicSimAttr isEqualTo []) then {
  _disableDynamicSim = _disableDynamicSimAttr # 0;
};

// Exit if there's no change
if (_dynamicSim isEqualTo (!_disableDynamicSim)) exitWith {
  LOG_3("Skipping update of dynamic simulation of '%1' ('%2' is equal to current value '%3')",_target,str !_disableDynamicSim,str _dynamicSim);
};

LOG_3("Updating dynamic simulation of '%1' to '%2' (current value: '%3')",_target,str !_disableDynamicSim,str _dynamicSim);

// Update attribute
_target set3DENAttribute ["dynamicSimulation", !_disableDynamicSim];
