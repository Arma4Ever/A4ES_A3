#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores waypoint for 3DEN from waypoint data
 */

params ["_group", "_waypointData"];
TRACE_1("units3DENComp_restoreData_waypoint",_waypointData);

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

private _waypoint = _group create3DENEntity ["Waypoint", _className, _posATL];

_waypoint set3DENAttribute ["Type", _className];
_waypoint set3DENAttribute ["position", _posATL];
_waypoint set3DENAttribute ["completionRadius", _completionRadius];
_waypoint set3DENAttribute ["combatMode", _combatMode];
_waypoint set3DENAttribute ["behaviour", _behaviour];
_waypoint set3DENAttribute ["formation", _formation];
_waypoint set3DENAttribute ["speedMode", _speedMode];
_waypoint set3DENAttribute ["condition", _condition];
_waypoint set3DENAttribute ["onActivation", _onActivation];
_waypoint set3DENAttribute ["script", _script];
