#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns group from group data during game
 */

params ["_groupData", "_vehicles", "_groupsDynSim", "_goUpAfterSpawn"];
TRACE_1("units3DENComp_spawnData_group",_groupData);

_groupData params [
  "_sideId",
  "_unitsData",
  "_waypointsData",
  "_combatMode",
  "_behaviour",
  "_formation",
  "_speedMode",
  "_garbageCollectGroup",
  "_disableDynamicSimulation",
  "_enableGunLights",
  "_lambsDangerDisableGroupAI",
  "_lambsDangerEnableGroupReinforce"
];

private _side = _sideId call BIS_fnc_sideType;
private _group = createGroup [_side, _garbageCollectGroup];
if (isNull _group) exitWith {
  ERROR_1("units3DENComp_spawnData_group abort: cannot create new group (side: %1)",str _side);
};

// Create units
{
  private _unitSpawn = [_x, _group, _vehicles, _goUpAfterSpawn] spawn FUNC(units3DENComp_spawnData_unit);
  waitUntil {scriptDone _unitSpawn};
  sleep 0.05;
} forEach _unitsData;

// Group params
_group setCombatMode _combatMode;
_group setBehaviourStrong _behaviour;
_group setFormation ([
  "WEDGE", "VEE", "LINE", "COLUMN", "FILE",
  "STAG COLUMN", "ECH LEFT", "ECH RIGHT", "DIAMOND"
] select _formation);
_group setSpeedMode (["LIMITED", "NORMAL", "FULL"] select _speedMode);

// Lambs
if (_lambsDangerDisableGroupAI) then {
  _group setVariable ["lambs_danger_disableGroupAI", true, true];
};
if (_lambsDangerEnableGroupReinforce) then {
  _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
};

// Gun Lights
if (_enableGunLights) then {
  _group enableGunLights "ForceOn";
};

// Dynamic simulation
if (
  (_groupsDynSim isEqualTo 1) ||
  {(_groupsDynSim isEqualTo 0) && !_disableDynamicSimulation}
) then {
  [QEGVAR(common,enableDynSim), [_group]] call CBA_fnc_serverEvent;
};

// Waypoints
{
  [_x, _group] call FUNC(units3DENComp_spawnData_waypoint);
  sleep 0.05;
} forEach _waypointsData;
