#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates trigger status for mission debug
 */

params ["_trigger", "_isActivated"];

diag_log text format ["Trigger %1 %2", _trigger, ["deaktywowany", "aktywowany"] select _isActivated];
