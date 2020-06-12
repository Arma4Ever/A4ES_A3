#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes given unit from squad
 */

params ["_unit", "_createNewSquad"];

// Exit if not server
if (!isServer) exitWith {};
