#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles RscRadar onUnload event
 */

LOG("Unloading RscRadar");

GVAR(enabled) = false;

//cleanup?

LOG("RscRadar unloaded");
