#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Show/hides logs (temporary - for intro, shows only if user enabled it)
 */

params ["_hide"];

if (!_hide && {!(profileNamespace getVariable [QGVAR(showLogs), false])}) exitWith {};
[!_hide] call FUNC(showLogs);
