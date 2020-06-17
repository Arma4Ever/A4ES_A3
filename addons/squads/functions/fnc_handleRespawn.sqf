#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_newUnit", "_corpse"];

// Exit if not server
if !(isServer) exitWith {};

LOG_1("Handling respawn event (unit: %1 corpse: %2)",str _unit,str _corpse);

// TODO
// Default
// Replace old unit with new unit in squad
// Delete old unit if it was a dummy unit
// Trigger squad change

// Reset squad on respawn option
// Reset unit squad
// Remove old unit?
// Trigger squad change for both old squad nad unit
