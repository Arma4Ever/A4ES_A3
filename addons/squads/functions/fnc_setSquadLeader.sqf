#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Marks given unit as squad leader
 */

params ["_unit"];

// Exit if not server
if (!isServer) exitWith {};
