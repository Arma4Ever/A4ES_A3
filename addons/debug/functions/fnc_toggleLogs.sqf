#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Toggles rpt logs box
 */

private _show = !(profileNamespace getVariable [QGVAR(showLogs), false]);
profileNamespace setVariable [QGVAR(showLogs), _show];
[_show] call FUNC(showLogs);
