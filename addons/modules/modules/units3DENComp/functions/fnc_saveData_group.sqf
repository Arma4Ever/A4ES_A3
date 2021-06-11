#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves group data for units3DENComp module
 */

params ["_group", "_vehiclesList", "_vehiclesCrewList"];
TRACE_1("units3DENComp_saveData_group",_group);

private _units = units _group;
// Make sure leader is always first in array
private _leader = leader _group;
_units deleteAt (_units find _leader);
_units insert [0, [_leader]];

private _unitsData = _units apply {[_x, _vehiclesList, _vehiclesCrewList] call FUNC(units3DENComp_saveData_unit)};

private _waypoints = (get3DENConnections _group) select {
  (_x isEqualType []) && {(count _x) isEqualTo 2} && {(_x # 0) isEqualTo _group}
};
// Sort waypoints by index
_waypoints sort true;

private _waypointsData = _waypoints apply {[_x] call FUNC(units3DENComp_saveData_waypoint)};

[
  (side _group) call BIS_fnc_sideID,
  _unitsData,
  _waypointsData,
  (_group get3DENAttribute "combatMode") # 0,
  (_group get3DENAttribute "behaviour") # 0,
  (_group get3DENAttribute "formation") # 0,
  (_group get3DENAttribute "speedMode") # 0,
  (_group get3DENAttribute "garbageCollectGroup") # 0,
  (_group get3DENAttribute QEGVAR(editor,disableDynamicSimulation)) # 0,
  (_group get3DENAttribute QEGVAR(editor,enableGunLights)) # 0,
  (_group get3DENAttribute "lambs_danger_disableGroupAI") # 0,
  (_group get3DENAttribute "lambs_danger_enableGroupReinforce") # 0
]
