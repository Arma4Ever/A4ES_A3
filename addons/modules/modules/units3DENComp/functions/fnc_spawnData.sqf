#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns units from units3DENComp data during game
 */

params ["_logic", "_data", "_params"];
TRACE_1("units3DENComp_spawnData",_logic);
_params params [
  "_groupsDynSim",
  "_goUpAfterSpawn",
  "_forceSpawnLying",
  "_forceDisablePATH",
  "_defenderBehaviour",
  "_vehiclesDynSim",
  "_clearVehCargo",
  "_unitPostInit",
  "_groupPostInit",
  "_vehiclePostInit"
];
_data params ["_vehiclesData", "_groupsData"];

private _vehicles = [];
{
  private _vehicle = [_x, _vehiclesDynSim, _clearVehCargo, _vehiclePostInit] call FUNC(units3DENComp_spawnData_vehicle);
  _vehicles pushBack _vehicle;
  sleep 0.05;
} forEach _vehiclesData;

{
  private _groupSpawn = [
    _x,
    _vehicles,
    _groupsDynSim,
    _goUpAfterSpawn,
    _forceSpawnLying,
    _forceDisablePATH,
    _defenderBehaviour,
    _unitPostInit,
    _groupPostInit
  ] spawn FUNC(units3DENComp_spawnData_group);
  waitUntil {scriptDone _groupSpawn};
  sleep 0.05;
} forEach _groupsData;

sleep 3;

// Delete module
deleteVehicle _logic;
