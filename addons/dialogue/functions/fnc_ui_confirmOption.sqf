#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Confirms selection of selected option, shows answer
 */

params ["_optionId"];
TRACE_1("ui_confirmOption",_optionId);

if !(_optionId in GVAR(optionsCache)) exitWith {};

GVAR(answerShown) = false;

private _currentDialogue = GVAR(currentDialogue);
private _talkingWith = GVAR(talkingWith);

private _option = GVAR(optionsCache) get _optionId;
_option params ["_optionAnswers", "", "_condition", "_isPersistent", "_answerLink", "_onSelectEH", "_sendServerEH"];

// Condition no longer true, update ui
if !([player, _talkingWith, _currentDialogue] call _condition) exitWith {
  0 call FUNC(ui_update);
};

private _persistentSelections = _talkingWith getVariable [QGVAR(persistentSelections), []];

// Save selection if option is persistent
if (_isPersistent && {!(_optionId in _persistentSelections)}) then {
  TRACE_2("Persistent option selected, saving",_optionId,_talkingWith);
  _persistentSelections pushBack _optionId;
  _talkingWith setVariable [QGVAR(persistentSelections), _persistentSelections, true];
};

// Call select EH
[player, _talkingWith, _currentDialogue, _optionId] call _onSelectEH;

// Call server select EH
if (_sendServerEH) then {
  [QGVAR(optionSelected), [player, _talkingWith, _currentDialogue, _optionId]] call CBA_Fnc_serverEvent;
};

private _answersData = _optionAnswers call FUNC(getAnswersData);
private _trueAnswer = _answersData call FUNC(getTrueAnswer);

// Don't react if no true answers
if (_trueAnswer == "") exitWith {};

GVAR(currentAnswer) = _trueAnswer;

0 call FUNC(requestMissingData);
0 call FUNC(ui_update);
