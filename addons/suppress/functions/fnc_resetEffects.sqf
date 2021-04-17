#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Resets all post process effects
 */

private _display = uiNamespace getVariable QGVAR(overlay);
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
_overlayCtrl ctrlSetFade 1;
_overlayCtrl ctrlCommit 0;
