#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns first true (available) answer
 */

params ["_answers"];

private _currentDialogue = GVAR(currentDialogue);
private _talkingWith = GVAR(talkingWith);

private _trueAnswer = "";

{
  _x params ["", "", "_condition", "", "", "_id"];

  if ([player, _talkingWith, _currentDialogue] call _condition) exitWith {
    _trueAnswer = _id;
  };
} forEach _answers;

_trueAnswer
