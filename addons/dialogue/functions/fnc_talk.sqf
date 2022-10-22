#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Opens dialogue ui with talking options with given unit
 */

params ["_unit", "_player"];

if !(_this call FUNC(canTalk)) exitWith {};

private _dialogue = _unit call FUNC(getUnitDialogue);
if (_dialogue == "") exitWith {};

_unit setVariable [QGVAR(talkingWith), _player, true];
_player setVariable [QGVAR(talkingWith), _unit, true];

[QGVAR(talkStart), [_unit, _player], [_unit]] call CBA_fnc_targetEvent;

GVAR(talkingWith) = _unit;
GVAR(currentDialogue) = _dialogue;
GVAR(currentAnswer) = "";
GVAR(currentOption) = "";

GVAR(showingAnswer) = false;
GVAR(answerShown) = false;

createDialog QGVAR(ui);
