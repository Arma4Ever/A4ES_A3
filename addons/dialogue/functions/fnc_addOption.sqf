#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds option to dialogue tree
 */

params [
  "_text",
  ["_condition", {}],
  ["_answers", []],
  //["_parentAnswerId", ""],
  //["_parentDialogueId", ""],
  ["_id", ""],
  ["_isPersistent", false],
  ["_answerLink", ""],
  ["_onSelectClientEH", {}],
  ["_onSelectServerEH", {}],
  ["_changeLogicFlag", []]
];
TRACE_1("addOption",_text);

if (!isServer) exitWith {""};

if (_id == "") then {
  _id = "opt_" + (str GVAR(optionsCount));
  GVAR(optionsCount) = GVAR(optionsCount) + 1;
};

if (_condition isEqualTo {}) then {
  _condition = {true};
};

/*
usunac te zmienne awaiting jesli okaze sie ze ich nie potrzebuje






*/

/* // Assign option to parent answer if present
if (_parentAnswerId != "") then {
  if (_parentAnswerId in GVAR(answers)) then {
    private _parentAnswer = GVAR(answers) get _parentAnswerId;
    (_parentAnswer # 0) pushBackUnique _id;
  } else {
    GVAR(awaitingAnswerOptions) pushBackUnique _id;
  };
} else {
  // Assign option to parent dialog if present and option not present (exclusive)
  if (_parentDialogueId == "") exitWith {};
  if (_parentDialogueId in GVAR(dialogues)) then {
    private _parentDialogue = GVAR(dialogues) get _parentDialogueId;
    (_parentDialogue # 0) pushBackUnique _id;
  } else {
    GVAR(awaitingDialogueOptions) pushBackUnique _id;
  };
}; */

GVAR(options) set [
  _id,
  [
    _answers,
    _text,
    _condition,
    _isPersistent,
    _answerLink,
    _onSelectClientEH,
    _onSelectServerEH,
    _changeLogicFlag
  ]
];

_id
