#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles killed event
 */

params ["_unit"];

// Exit if not server
if !(isServer) exitWith {};
