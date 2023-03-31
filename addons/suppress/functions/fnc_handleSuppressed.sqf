#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles suppressed EH
 */

params ["_unit", "_distance", "_shooter"];

TRACE_3("handleSuppressed",_unit,_distance,_shooter);

if (
  // Exit if EH is triggered for remote unit - should not happen
  !(local _unit) ||
  // Exit if unit is dead (can be spectator)
  {!(alive _unit)} ||
  // Exit if some display is interrpting (arsenal, spectator, curator, etc.)
  {EGVAR(squadradar,displayInterrupt)} ||
  // Exit if unit in vehicle
  {!(isNull (objectParent _unit))} ||
  // Exit if unit is unconscious
  {_unit getVariable ["ACE_isUnconscious", false]}
) exitWith {};

private _newSuppress = linearConversion [9, 1, _distance, 0, 1, true];

// Exit if shot has no effect
if (_newSuppress isEqualTo 0) exitWith {};

private _display = uiNamespace getVariable [QGVAR(overlay), displayNull];
// Exit if no display - should not happen
if (isNull _display) exitWith {};

private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
private _curSuppress = 1 - (ctrlFade _overlayCtrl);

private _suppress = (_newSuppress + _curSuppress) min 1;

TRACE_1("Suppress value updated",_suppress);

private _ppFactor = (_suppress * 0.35);

// Add effects
_overlayCtrl ctrlSetFade (1 - _suppress);
_overlayCtrl ctrlCommit 0.07;
GVAR(ppEffectBlur) ppEffectAdjust [(_ppFactor * 1.28)];
GVAR(ppEffectBlur) ppEffectCommit 0.07;
GVAR(ppEffectCC) ppEffectAdjust [1, 1, 0, [0,0,0,0], [1, 1, 1, (1 - (_ppFactor * 0.25))], [1, 1, 1, 0]];
GVAR(ppEffectCC) ppEffectCommit 0.07;

if ((CBA_missionTime - GVAR(lastSuppress)) >= 10) then {
	addCamShake [3, 0.4, 80];
};

// Save last suppress time for shake
GVAR(lastSuppress) = CBA_missionTime;

// Schedule effects cleanup
_overlayCtrl spawn {
  sleep 0.07;
  _this ctrlSetFade 1;
  _this ctrlCommit 7;

  GVAR(ppEffectBlur) ppEffectAdjust [0];
  GVAR(ppEffectBlur) ppEffectCommit 7;
  GVAR(ppEffectCC) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
  GVAR(ppEffectCC) ppEffectCommit 7;
};
