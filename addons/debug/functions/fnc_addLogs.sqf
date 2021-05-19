#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds logs to logs list
 */

params ["_logs"];

_logs append GVAR(logs);

// Store max 30 last logs
if ((count _logs) > 30) then {
  _logs resize 30;
};

GVAR(logs) = _logs;

// Don't update logs list text if list is hidden
if !(GVAR(showLogs)) exitWith {};

private _display = uiNamespace getVariable [QGVAR(logsList), displayNull];
if (isNull _display) exitWith {};

private _logsListTextCtrl = _display displayCtrl IDC_LOGSLIST;
_logsListTextCtrl ctrlSetStructuredText (parseText (_logs joinString "<br />"));
