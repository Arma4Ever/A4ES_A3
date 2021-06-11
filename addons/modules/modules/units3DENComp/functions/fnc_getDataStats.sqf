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

format [
  "%1: %2
%3: %4
%5: %6
%7: %8",
  LLSTRING(units3DENComp_DataStats_Vehicles), _vehicles,
  LLSTRING(units3DENComp_DataStats_Groups), _groups,
  LLSTRING(units3DENComp_DataStats_Units), _units,
  LLSTRING(units3DENComp_DataStats_Waypoints), _waypoints
]
