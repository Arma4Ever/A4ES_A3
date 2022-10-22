#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Forces selection of given option
 */

params ["_forcedOption"];
TRACE_1("forceOption",_forcedOption);

private _option = GVAR(optionsCache) get _forcedOption;
private _optionAnswers = _option # 0;
private _answersData = _optionAnswers call FUNC(getAnswersData);

GVAR(answerShown) = false;
0 call FUNC(ui_disableOptions);

private _trueAnswer = _answersData call FUNC(getTrueAnswer);

// Don't react if no true answers
if (_trueAnswer == "") exitWith {};

GVAR(currentAnswer) = _trueAnswer;

if !(0 call FUNC(requestMissingData)) then {
  0 call FUNC(ui_update);
};
