#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Disabled options selection releated UI elements
 */
LOG("ui_disableOptions");

private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];
if (isNull _display) exitWith {};

// Disable UI
{
  _x ctrlEnable false;
  _x ctrlSetFade 0.5;
  _x ctrlCommit 0;
} forEach [
  _display displayCtrl IDC_DIALOGUE_UI_LISTOPTIONS_LABEL,
  _display displayCtrl IDC_DIALOGUE_UI_LISTOPTIONS,
  _display displayCtrl IDC_DIALOGUE_UI_CONFIRM_LABEL,
  _display displayCtrl IDC_DIALOGUE_UI_CONFIRM_BTN
];
