#include "script_component.hpp"

if (!hasInterface) exitWith {};

["SettingsInitialized", {
    // Register fire event handler
    ["firedPlayer", DFUNC(handleFired)] call ace_common_fnc_addEventHandler;
}] call ace_common_fnc_addEventHandler;
