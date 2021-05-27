#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles entityKilled mission event, makes sure group reacts to kills, even if sim disabled
 */

params ["_entity"];
TRACE_1("handleEntityKilled",_entity);

if (
  !(_entity isKindOf "CAManBase") ||
  {simulationEnabled _entity}
) exitWith {
  if (_entity isKindOf "AllVehicles") then {
    // Enable dyn sim for wrecks
    if !(dynamicSimulationEnabled _entity) then {
      TRACE_1("Enabling dyn sim for wreck",_entity);
      _entity enableDynamicSimulation true;
    };
  };
};

private _target = group _entity;
private _targetUnits = units _target;
// Target unit if group is null (agents)
if (isNull _target) then {
  _target = _entity;
  _targetUnits = [_entity];
};

// Don't react if disabled simulation is not by dyn sim
if !(dynamicSimulationEnabled _target) exitWith {};

// Disable target dyn sim and enable sim for all units
TRACE_2("Force enabling target sim",_target,_targetUnits);
_target enableDynamicSimulation false;
{
  _x enableSimulationGlobal true;
} forEach _targetUnits;

// Check vehicle
private _vehicle = objectParent _entity;

// Exit if no vehicle, vehicle sim enabled or dyn sim is not reason for disabled sim
if (isNull _vehicle || {simulationEnabled _vehicle} || {!(dynamicSimulationEnabled _vehicle)}) exitWith {};

TRACE_1("Force enabling vehicle sim",_vehicle);
_vehicle enableDynamicSimulation false;
_vehicle enableSimulationGlobal true;
