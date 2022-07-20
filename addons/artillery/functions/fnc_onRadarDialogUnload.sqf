#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles radar dialog unload event
 */

LOG("onRadarDialogUnload");

uiNamespace setVariable [QGVAR(radarDialogDisplay), displayNull];
terminate GVAR(radarDialogUpdateTimer);
