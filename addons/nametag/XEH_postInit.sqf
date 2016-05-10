#include "script_component.hpp"

//Command menu hotkey
["A3CS Nametag", QGVAR(ToggleCommanderBar), localize LSTRING(ToggleCommanderBar_DisplayName), {
    ace_ui_groupBar = !ace_ui_groupBar;
    [true] call ace_ui_fnc_setElements;
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind;


if (hasInterface) then {
    // Wait until the colors are defined before starting to draw the nametags
    ["SettingsInitialized", {
        ["init"] call FUNC(updateSettings);
    }] call ace_common_fnc_addEventHandler;

    // Change settings accordingly when they are changed
    ["SettingChanged", {
        _this call FUNC(updateSettings);
    }] call ace_common_fnc_addEventHandler;
};
