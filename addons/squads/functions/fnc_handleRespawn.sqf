#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

params ["_newUnit", "_oldUnit"];

// Exit if not server
if !(isServer) exitWith {};
