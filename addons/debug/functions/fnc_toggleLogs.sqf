#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Toggle rpt logs box
 */

GVAR(showLogs) = !GVAR(showLogs);
private _display = uiNamespace getVariable [QGVAR(logsList), displayNull];
if (isNull _display) exitWith {};
private _logsListTextCtrl = _display displayCtrl IDC_LOGSLIST;
_logsListTextCtrl ctrlSetFade (parseNumber (!GVAR(showLogs)));
_logsListTextCtrl ctrlCommit 0;

// Update logs list text
if (GVAR(showLogs)) then {
  [[]] call FUNC(addLogs);
};
