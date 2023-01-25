#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

[
  "A4ES UI", QGVAR(toggleScreenshotMode),
  [
    LLSTRING(ToggleScreenshotMode),
    LLSTRING(ToggleScreenshotMode_Tooltip)
  ], {
    true call FUNC(toggleScreenshotMode);
  }, {}, [DIK_BACK, [true, false, false]]
] call CBA_fnc_addKeybind;
