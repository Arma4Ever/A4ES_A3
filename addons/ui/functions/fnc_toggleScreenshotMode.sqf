#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Toogles screenshow mode (hide/show game UI)
 */

if (!hasInterface) exitWith {};

if (GVAR(screenshotModeEnabled)) then {
  showHUD GVAR(lastShownHUD);
  GVAR(screenshotModeEnabled) = false;
} else {
  GVAR(lastShownHUD) = shownHUD;
  showHUD [false, false, false, false, false, false, false, false, false, false];
  GVAR(screenshotModeEnabled) = true;
};
