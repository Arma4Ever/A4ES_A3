#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns waypoint from waypoint data during game
 */

params ["_waypointData", "_group"];
TRACE_2("units3DENComp_spawnData_waypoint",_waypointData,_group);

// Create waypoints on server
[QGVAR(spawnData_waypoint), [_waypointData, _group]] call CBA_fnc_serverEvent;
