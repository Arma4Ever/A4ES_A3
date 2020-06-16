#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles killed event
 */

params ["_unit"];

if !(_unit isEqualTo ace_player) exitWith {};

// Update UI if player is dead
false call FUNC(updateUI);
