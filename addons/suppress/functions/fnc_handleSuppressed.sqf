#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles suppressed EH
 */

params ["_unit", "_distance"];

if (
  // Exit if EH is triggered for remote unit - should not happen
  !(local _unit) ||
  // Exit if unit in vehicle & not turned out
  {!(isNull (objectParent _unit) || isTurnedOut _unit)} ||
  // Exit if unit is unconscious
  {_unit getVariable ["ACE_isUnconscious", false]}
) exitWith {};

private _newSuppress = linearConversion [9, 1, _distance, 0, 1, true];

// Exit if shot has no effect
if (_newSuppress isEqualTo 0) exitWith {};

private _display = uiNamespace getVariable QGVAR(overlay);
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;

private _curSuppress = 1 - (ctrlFade _overlayCtrl);
private _suppress = (_newSuppress + _curSuppress) min 1;

_overlayCtrl ctrlSetFade (1 - _suppress);
_overlayCtrl ctrlCommit 0.07;
_overlayCtrl spawn {
  sleep 0.07;
  _this ctrlSetFade 1;
  _this ctrlCommit 8;
};
