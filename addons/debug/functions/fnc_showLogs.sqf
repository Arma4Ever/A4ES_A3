#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows/hides rpt logs box
 */

params ["_show"];

private _display = uiNamespace getVariable [QGVAR(logsList), displayNull];
if (isNull _display) exitWith {};
private _logsListTextCtrl = _display displayCtrl IDC_LOGSLIST;
_logsListTextCtrl ctrlSetFade (parseNumber (!_show));
_logsListTextCtrl ctrlCommit 0;

// Update logs list text
if (_show) then {
  [[]] call FUNC(addLogs);
};
