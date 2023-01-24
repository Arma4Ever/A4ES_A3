#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows options of given dialogue or answer
 */

params ["_options"];

private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];
if (isNull _display) exitWith {};

private _ctrlListOptionsLabel = _display displayCtrl IDC_DIALOGUE_UI_LISTOPTIONS_LABEL;
private _ctrlListOptions = _display displayCtrl IDC_DIALOGUE_UI_LISTOPTIONS;
private _ctrlConfirmLabel = _display displayCtrl IDC_DIALOGUE_UI_CONFIRM_LABEL;
private _ctrlConfirmBtn = _display displayCtrl IDC_DIALOGUE_UI_CONFIRM_BTN;

private _optionsCtrls = [_ctrlListOptionsLabel, _ctrlListOptions, _ctrlConfirmLabel, _ctrlConfirmBtn];

if (
  (_options isEqualTo []) ||
  {GVAR(showingAnswer)} ||
  {GVAR(awaitingData)}
) exitWith {
  0 call FUNC(ui_disableOptions);

  // Reset UI if options empty
  if (_options isEqualTo []) then {
    lbClear _ctrlListOptions;
  };
};

// Enable UI elements
{
  _x ctrlEnable true;
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
} forEach _optionsCtrls;

// Clear UI
lbClear _ctrlListOptions;

// Add valid options
private _currentDialogue = GVAR(currentDialogue);
private _talkingWith = GVAR(talkingWith);
private _persistentSelections = GVAR(talkingWith) getVariable [QGVAR(persistentSelections), []];
private _persistentOptionsPresent = false;

{
  _x params ["", "_text", "_condition", "_isPersistent", "", "", "", "_id"];

  if !([player, _talkingWith, _currentDialogue] call _condition) then {continue;};

  // Add option
  private _index = _ctrlListOptions lbAdd (_text call EFUNC(common,localize));
  _ctrlListOptions lbSetData [_index, _id];

  if (_isPersistent) then {
    _persistentOptionsPresent = true;
    // TODO: ICON
  };
} forEach _options;

// Update options label text
if (_persistentOptionsPresent) then {
  // TODO
} else {
  // TODO
};
