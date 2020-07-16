#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

// Add takedown keybind
[
  "A3CS Stealth", QGVAR(takedown),
  [
    localize LSTRING(Takedown),
    localize LSTRING(Takedown_Tooltip)
  ], {
    call FUNC(takedown);
  }, {}, [DIK_SPACE, [false, true, false]]
] call CBA_fnc_addKeybind;

// Start walking PFH
[{
  call FUNC(walkingPFH);
}, 0.5, []] call CBA_fnc_addPerFrameHandler;
