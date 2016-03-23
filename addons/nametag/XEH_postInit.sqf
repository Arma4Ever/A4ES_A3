#include "script_component.hpp"

["A3CS Nametag", QGVAR(ToggleCommanderBar), localize LSTRING(ToggleCommanderBar_DisplayName), {
    GVAR(enableCommandBar) = !GVAR(enableCommandBar);
    QGVAR(enableCommandBar) call FUNC(updateSettings);
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
