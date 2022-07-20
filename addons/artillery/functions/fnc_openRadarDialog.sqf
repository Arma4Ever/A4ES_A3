#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Opens radar dialog
 */

params ["_target", "_player"];
TRACE_2("openRadarDialog",_target,_player);

createDialog QGVAR(artilleryRadarDialog);
