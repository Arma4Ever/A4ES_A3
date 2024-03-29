#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_newUnit", "_corpse"];

// Exit if not server
if !(isServer) exitWith {};

LOG_2('Handling respawn event (unit: "%1" corpse: "%2")',str _unit,str _corpse);

// Replace corpse with new unit
[_corpse, _newUnit] call FUNC(replaceSquadUnit);

// TODO
// Reset squad on respawn option
// Reset unit squad
// Remove old unit?
// Trigger squad change for both old squad nad unit
