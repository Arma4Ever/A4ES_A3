#include "script_component.hpp"

["A3CS Nametag", QGVAR(ToggleCommanderBar), localize LSTRING(ToggleCommanderBar_DisplayName), {
    GVAR(enableCommandBar) = !GVAR(enableCommandBar);
    QGVAR(enableCommandBar) call FUNC(updateSettings);
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind;
