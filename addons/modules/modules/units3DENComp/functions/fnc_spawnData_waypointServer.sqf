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
  "_speedMode",
  "_condition",
  "_onActivation",
  "_script"
];

private _posASL = ATLtoASL _posATL;
private _waypoint = _group addWaypoint [_posASL, -1];

// Use SCRIPTED as default
private _type = "SCRIPTED";

// Check if className is engine waypoint
private _waypointCfg = configfile >> "CfgWaypoints" >> "Default" >> _className;
if (isClass _waypointCfg) then {
  _type = getText (_waypointCfg >> "type");
  // Fallback to move in case some mod waypoint is added as default
  if (_type isEqualTo "") then {_type = "MOVE";};
};

_waypoint setWaypointType _type;
_waypoint setWaypointCompletionRadius _completionRadius;
_waypoint setWaypointCombatMode _combatMode;
_waypoint setWaypointBehaviour _behaviour;
_waypoint setWaypointFormation ([
  "NO CHANGE", "WEDGE", "VEE", "LINE", "COLUMN", "FILE",
  "STAG COLUMN", "ECH LEFT", "ECH RIGHT", "DIAMOND"
] select _formation);
_waypoint setWaypointSpeed (["UNCHANGED", "LIMITED", "NORMAL", "FULL"] select _speedMode);
_waypoint setWaypointStatements [_condition, _onActivation];

// Override script only if scripted waypoint
if ((toLower _type) isEqualTo "scripted") then {
  _waypoint setWaypointScript _script;
};
