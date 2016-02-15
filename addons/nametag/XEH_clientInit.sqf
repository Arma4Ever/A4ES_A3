#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Wait until the colors are defined before starting to draw the nametags
["SettingsInitialized", {
    ["init"] call FUNC(updateSettings);
}] call ace_common_fnc_addEventHandler;

// Change settings accordingly when they are changed
["SettingChanged", {
    _this call FUNC(updateSettings);
}] call ace_common_fnc_addEventHandler;
