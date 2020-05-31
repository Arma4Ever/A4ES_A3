#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

[
  "A3CS UI", QGVAR(toggleScreenshotMode),
  [
    localize LSTRING(ToggleScreenshotMode),
    localize LSTRING(ToggleScreenshotMode_Tooltip)
  ], {
    call FUNC(toggleScreenshotMode);
  }, {}, [DIK_BACK, [true, false, false]]
] call CBA_fnc_addKeybind;
