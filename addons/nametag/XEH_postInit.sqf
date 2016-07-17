#include "script_component.hpp"

//Command menu hotkey
["A3CS Nametag", QGVAR(ToggleCommanderBar), localize LSTRING(ToggleCommanderBar_DisplayName), {
    ace_ui_groupBar = !ace_ui_groupBar;
    [true] call ace_ui_fnc_setElements;
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind;

if ((tolower missionName) in ["intro", "intro1", "intro_new", "tanoa_intro1"]) exitWith {};

if (hasInterface) then {
    // Wait until the colors are defined before starting to draw the nametags
    ["ace_settingsInitialized", {
        ["init"] call FUNC(updateSettings);
    }] call CBA_fnc_addEventHandler;

    // Change settings accordingly when they are changed
    ["ace_settingChanged", {
        _this call FUNC(updateSettings);
    }] call CBA_fnc_addEventHandler;
};
