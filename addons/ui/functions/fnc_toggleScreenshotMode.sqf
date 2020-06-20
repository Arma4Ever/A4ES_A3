#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Toogles screenshot mode (hide/show game UI)
 */

if (!hasInterface) exitWith {};

if (GVAR(screenshotModeEnabled)) then {
  hintSilent parseText format ["<t size='1.5'>%1</t>", localize LSTRING(screenshotModeDisabled)];
  showHUD GVAR(lastShownHUD);
  GVAR(screenshotModeEnabled) = false;

  [{GVAR(screenshotModeEnabled)}, {}, [], 0.8, {hintSilent ""}] call CBA_fnc_waitUntilAndExecute;
} else {
  hintSilent "";
  GVAR(lastShownHUD) = shownHUD;
  showHUD [false, false, false, false, false, false, false, false, false, false];
  GVAR(screenshotModeEnabled) = true;
};

[QGVAR(screenshotModeToggled), [GVAR(screenshotModeEnabled)]] call CBA_fnc_localEvent;
