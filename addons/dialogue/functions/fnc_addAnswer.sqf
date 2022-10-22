#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds answer to gien option
 */

params [
  ["_text", ""],
  ["_condition", {}],
  ["_options", []],
  ["_id", ""],
  ["_onShowClientEH", {}],
  ["_onShowServerEH", {}],
  ["_changeLogicFlag", []]
];
TRACE_2("addAnswer",_id,_text);

if (!isServer) exitWith {""};

if (_id == "") then {
  _id = "ans_" + (str GVAR(answersCount));
  GVAR(answersCount) = GVAR(answersCount) + 1;
  TRACE_1("addAnswer - updating id",_id);
};

if (_condition isEqualTo {}) then {
  _condition = {true};
};

if (_id in GVAR(awaitingAnswerOptions)) then {
  _options append (GVAR(awaitingAnswerOptions) deleteAt _id);
};

if !(_text isEqualType []) then {
  _text = [_text];
};

GVAR(answers) set [
  _id,
  [
    _options,
    _text,
    _condition,
    _onShowClientEH,
    _onShowServerEH,
    _changeLogicFlag
  ]
];

_id
