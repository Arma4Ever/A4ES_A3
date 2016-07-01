/*
 * Author: SzwedzikPL
 * Remove group
 */
#include "script_component.hpp"

params ["_group"];

if (!local _group) exitWith {};

{deleteWaypoint [_group, 0];} forEach (waypoints _group);
deleteGroup _group;
