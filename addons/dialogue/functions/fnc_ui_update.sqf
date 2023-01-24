#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates dialogue UI
 */

private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];

private _currentDialogue = GVAR(currentDialogue);
private _currentAnswer = GVAR(currentAnswer);
private _talkingWith = GVAR(talkingWith);

if (
  (isNull _display) ||
  {_currentDialogue == ""} ||
  {GVAR(showingAnswer)} ||
  {GVAR(awaitingData)} ||
  {isNull _talkingWith}
) exitWith {};

private _dialogue = GVAR(dialoguesCache) get _currentDialogue;
if (_dialogue isEqualTo []) exitWith {closeDialog 0;};
_dialogue params [
  "_dialOptions",
  "_dialTitle",
  "_dialInitialMsg",
  "_dialCond",
  "_dialRejectionMsg",
  "_dialStartEH",
  "_dialSendServerEH"
];

if ((ctrlText _ctrlTitle) == "") then {
  private _ctrlTitle = _display displayCtrl IDC_DIALOGUE_UI_TITLE;
  private _titleText = _dialTitle call EFUNC(common,localize);
  if (_titleText == "") then {_titleText = "%1";};

  _ctrlTitle ctrlSetStructuredText parseText format [
    _titleText,
    _talkingWith call EFUNC(common,getUnitName)
  ];

  // Call dialogue started client EH
  [player, _talkingWith, _currentDialogue] call _dialStartEH;

  // Call dialogue started server EH
  if (_dialSendServerEH) then {
    [QGVAR(dialogueStarted), [player, _talkingWith, _currentDialogue]] call CBA_Fnc_serverEvent;
  };
};

// Show rejection message if dialogue cond not valid
if !([player, _talkingWith, _currentDialogue] call _dialCond) exitWith {
  (selectRandom _dialRejectionMsg) call FUNC(ui_showText);
};

// Show initial message and options if no current answer
if (_currentAnswer == "") exitWith {
  private _dialOptionsData = _dialOptions call FUNC(getOptionsData);
  private _forcedOption = _dialOptionsData call FUNC(getForcedOption);

  if (_forcedOption != "") exitWith {
    _forcedOption call FUNC(forceOption);
  };

  if (GVAR(answerShown)) then {
    // Show dialogue options
    _dialOptionsData call FUNC(ui_showOptions);
  } else {
    // Show initial message
    (selectRandom _dialInitialMsg) call FUNC(ui_showText);
  };
};

private _answer = GVAR(answersCache) get _currentAnswer;
// Don't close answer if no data, just let user choose different option
if (_answer isEqualTo []) exitWith {};
_answer params [
  "_answOptions",
  "_answText",
  "_answCond",
  "_answShowEH",
  "_answSendServerEH"
];

private _answOptionsData = _answOptions call FUNC(getOptionsData);
private _forcedOption = _answOptionsData call FUNC(getForcedOption);

if (_forcedOption != "") exitWith {
  _forcedOption call FUNC(forceOption);
};

if (GVAR(answerShown)) then {
  // Show options
  _answOptionsData call FUNC(ui_showOptions);
} else {
  // Call show EH
  [player, _talkingWith, _currentDialogue, _answer] call _answShowEH;

  // Call server show EH
  if (_answSendServerEH) then {
    [QGVAR(answerShown), [player, _talkingWith, _currentDialogue, _answer]] call CBA_Fnc_serverEvent;
  };

  // Show answer
  (selectRandom _answText) call FUNC(ui_showText);
};
