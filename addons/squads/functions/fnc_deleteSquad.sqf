#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Deletes squad
 */

params ["_squad"];

// Exit if not on server
if !(isServer) exitWith {};
