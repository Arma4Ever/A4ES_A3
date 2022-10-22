#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Dialogue UI display onLoad handler
 */

params ["_display"];

uiNamespace setVariable [QGVAR(uiDisplay), _display];

if (
  (GVAR(currentDialogue) == "") ||
  {isNull GVAR(talkingWith)}
) exitWith {closeDialog 0};

// Prep option confirm button
private _ctrlConfirmBtn = _display displayCtrl IDC_DIALOGUE_UI_CONFIRM_BTN;
_ctrlConfirmBtn ctrlAddEventHandler ["buttonClick", {
  private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];
  if (isNull _display) exitWith {};

  private _ctrlListOptions = _display displayCtrl IDC_DIALOGUE_UI_LISTOPTIONS;
  private _index = lbCurSel _ctrlListOptions;
  if (_index == -1) exitWith {};

  private _optionId = _ctrlListOptions lbData _index;
  if (_optionId == "") exitWith {};

  _optionId call FUNC(ui_confirmOption);
}];

// Prep options select label


// Lock options
0 call FUNC(ui_disableOptions);

// Start checking PFH
[{
  params ["_args", "_handle"];

  if !(_args call FUNC(canKeepTalking)) then {
    LOG("Can't keep talking - closing...");

    // Remove PFH
    [_handle] call CBA_Fnc_removePerFrameHandler;
    GVAR(talkingCheckLoopPFH) = -1;

    // Close dialog
    if !(isNull (uiNamespace getVariable [QGVAR(uiDisplay), displayNull])) then {
      closeDialog 0;
    };
  };
}, 0.25, [GVAR(talkingWith)]] call CBA_fnc_addPerFrameHandler;

// Exit if some data missing - receive handler will call ui update
if (0 call FUNC(requestMissingData)) exitWith {};

// All needed data are in cache - update ui
0 call FUNC(ui_update);
