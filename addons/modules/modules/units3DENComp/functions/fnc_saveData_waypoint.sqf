#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves waypoint data for units3DENComp module
 */

params ["_waypoint"];
TRACE_1("units3DENComp_saveData_waypoint",_waypoint);

[
  (_waypoint get3DENAttribute "itemClass") # 0,
  (_waypoint get3DENAttribute "position") # 0,
  (_waypoint get3DENAttribute "completionRadius") # 0,
  (_waypoint get3DENAttribute "combatMode") # 0,
  (_waypoint get3DENAttribute "behaviour") # 0,
  (_waypoint get3DENAttribute "formation") # 0,
  (_waypoint get3DENAttribute "speedMode") # 0,
  (_waypoint get3DENAttribute "condition") # 0,
  (_waypoint get3DENAttribute "onActivation") # 0,
  (_waypoint get3DENAttribute "script") # 0
]
