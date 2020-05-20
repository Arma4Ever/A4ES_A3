#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds interrupting display and updates displayInterrupt flag
 */

params ["_displayClass"];

GVAR(interruptingDisplays) pushBackUnique _displayClass;
GVAR(displayInterrupt) = !(GVAR(interruptingDisplays) isEqualTo []);
