#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Register fire event handler
    ["ace_firedPlayer", DFUNC(handleFired)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
