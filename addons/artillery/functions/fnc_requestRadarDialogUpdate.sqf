#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Requests radar dialog update from server
 */

LOG("requestRadarDialogUpdate");

private _display = uiNamespace getVariable [QGVAR(radarDialogDisplay), displayNull];
if (isNull _display) exitWith {};

// Terminate current timer
terminate GVAR(radarDialogUpdateTimer);

// Update status
private _ctrlStatus = _display displayCtrl IDC_RADARDIALOG_STATUS;
_ctrlStatus ctrlSetText LLSTRING(WaitingForData);

// Request update from server
[QGVAR(requestRadarDialogUpdate), player] call CBA_fnc_serverEvent;
