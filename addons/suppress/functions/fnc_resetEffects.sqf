#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Resets suppression effect
 */

private _display = uiNamespace getVariable [QGVAR(overlay), displayNull];
if (isNull _display) exitWith {};
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
_overlayCtrl ctrlSetFade 1;
_overlayCtrl ctrlCommit 0;
