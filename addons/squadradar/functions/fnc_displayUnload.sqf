#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes interrupting display and updates displayInterrupt flag
 */

params ["_displayClass"];

private _index = GVAR(interruptingDisplays) find _displayClass;

if (_index != -1) then {
  GVAR(interruptingDisplays) deleteAt _index;
};

GVAR(displayInterrupt) = !(GVAR(interruptingDisplays) isEqualTo []);

// Update squadradar ui
false call FUNC(updateUI);
