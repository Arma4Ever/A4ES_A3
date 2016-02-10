#include "script_component.hpp"

["ACE3 Vehicles", QGVAR(ToggleCollisionLights), localize LSTRING(ToggleCollisionLights_DisplayName), {
    (vehicle ace_player) setCollisionLight !(isCollisionLightOn (vehicle ace_player));
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind;
