#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
  LSTRING(Addon),
  QGVAR(showPlayerIcons),
  LSTRING(showPlayersIcons),
  {
    GVAR(showPlayerIcons) = true;
  },
  {
    GVAR(showPlayerIcons) = false;
  },
  [DIK_LMENU, [false, false, false]]
] call CBA_fnc_addKeybind;
