#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Resets suppression effect
 */

LOG("resetEffects");

private _display = uiNamespace getVariable [QGVAR(overlay), displayNull];
if (isNull _display) exitWith {};
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
_overlayCtrl ctrlSetFade 1;
_overlayCtrl ctrlCommit 0;

GVAR(ppEffectBlur) ppEffectAdjust [0];
GVAR(ppEffectBlur) ppEffectCommit 0;
GVAR(ppEffectCC) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
GVAR(ppEffectCC) ppEffectCommit 0;