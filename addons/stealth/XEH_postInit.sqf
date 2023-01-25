#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

// Add takedown keybind
[
  "A4ES Stealth", QGVAR(takedown),
  [
    LLSTRING(Takedown),
    LLSTRING(Takedown_Tooltip)
  ], {
    0 call FUNC(takedown);
  }, {}, [DIK_SPACE, [false, true, false]]
] call CBA_fnc_addKeybind;

// Start walking PFH
[{
  0 call FUNC(walkingPFH);
}, 0.5] call CBA_fnc_addPerFrameHandler;
