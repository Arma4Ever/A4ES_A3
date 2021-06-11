#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns waypoint from waypoint data during game
 */

params ["_waypointData", "_group"];
TRACE_2("units3DENComp_spawnData_waypointServer",_waypointData,_group);

_waypointData params [
  "_className",
  "_posATL",
  "_completionRadius",
  "_combatMode",
  "_behaviour",
  "_formation",
  "_speedMode"
];

private _posASL = ATLtoASL _posATL;
private _waypoint = _group addWaypoint [_posASL, -1];

_waypoint setWaypointType _className;
_waypoint setWaypointCompletionRadius _completionRadius;
_waypoint setWaypointCombatMode _combatMode;
_waypoint setWaypointBehaviour _behaviour;
_waypoint setWaypointFormation ([
  "NO CHANGE", "WEDGE", "VEE", "LINE", "COLUMN", "FILE",
  "STAG COLUMN", "ECH LEFT", "ECH RIGHT", "DIAMOND"
] select _formation);
_waypoint setWaypointSpeed (["UNCHANGED", "LIMITED", "NORMAL", "FULL"] select _speedMode);
