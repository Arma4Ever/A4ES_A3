#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles onConnectingEnd 3DEN event
 */

params ["_type", "_from"];

// Exit if it's not a group connection
if (_type isNotEqualTo "Group") exitWith {};

// Exit if source is empty
if (_from isEqualTo []) exitWith {};

// Update all relevant entities
{
  _x call FUNC(updateDynamicSimulation);
} forEach (_from # 0);
