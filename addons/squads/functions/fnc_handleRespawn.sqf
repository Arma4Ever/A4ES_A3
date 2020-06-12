#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_newUnit", "_corpse"];

// Exit if not server
if !(isServer) exitWith {};

LOG_1("Hanling respawn event (unit: %1 corpse: %2)",str _unit,str _corpse);
