#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles units status updates like talking, beeing unconscious etc.
 */

params ["_unit"];

// Exit if units are not in same squad
if !([ace_player, _unit] call EFUNC(squads,areInSameSquad)) exitWith {};

// Refesh members cache
call FUNC(refreshMembersCache);

// Redraw memberlist if unit in range
if ((_unit distance ace_player) < RADAR_MAX_UNIT_DISTANCE) then {
  false call FUNC(drawMemberlist);
};
