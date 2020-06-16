#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles settings change event
 */

LOG_1("Settings changed (settingsInitialized: %1)",str GVAR(settingsInitialized));

if !(GVAR(settingsInitialized)) exitWith {};

// Update UI with settings
true call FUNC(updateUI);
