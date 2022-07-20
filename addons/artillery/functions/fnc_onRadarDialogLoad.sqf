#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles radar dialog load event
 */

params ["_display"];
TRACE_1("onRadarDialogLoad",_display);

uiNamespace setVariable [QGVAR(radarDialogDisplay), _display];

private _refreshButton = _display displayCtrl IDC_RADARDIALOG_REFRESH;
_refreshButton ctrlAddEventHandler ["buttonClick", {
  0 call FUNC(requestRadarDialogUpdate);
}];

0 call FUNC(requestRadarDialogUpdate);
