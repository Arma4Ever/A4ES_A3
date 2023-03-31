#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns saved data stats
 */

params ["_vehiclesData", "_groupsData"];

private _vehicles = count _vehiclesData;
private _groups = count _groupsData;
private _units = 0;
private _waypoints = 0;

{
  _units = _units + (count (_x # 1));
  _waypoints = _waypoints + (count (_x # 2));
} forEach _groupsData;

[_vehicles, _groups, _units, _waypoints]
