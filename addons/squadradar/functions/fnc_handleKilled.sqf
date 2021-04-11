#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles killed event
 */

params ["_unit"];

if (_unit isNotEqualTo ace_player) exitWith {};

LOG("Handling killed event");

// Update UI if player is dead
false call FUNC(updateUI);
