#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets unique id attribute on given module
 */

LOG("updateModuleActivatorPlayers");

GVAR(moduleActivatorPlayers) = ((playableUnits + switchableUnits) select {
  !(_x isKindOf 'VirtualMan_F')
});
