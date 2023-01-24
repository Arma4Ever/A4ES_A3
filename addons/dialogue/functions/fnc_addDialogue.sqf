#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds dialogue tree
 */

params [
  ["_uiTitle", "%1"],
  ["_initialMessage", ""],
  ["_condition", {}],
  ["_rejectionMessage", ""],
  ["_options", []],
  ["_id", ""],
  ["_onStartClientEH", {}],
  ["_onStartServerEH", {}],
  ["_onEndClientEH", {}],
  ["_onEndServerEH", {}],
  ["_changeLogicFlag", []]
];
TRACE_2("addDialogue",_id,_text);

if (!isServer) exitWith {""};

if (_id == "") then {
  _id = "dia_" + (str GVAR(dialoguesCount));
  GVAR(dialoguesCount) = GVAR(dialoguesCount) + 1;
  TRACE_1("addDialogue - updating id",_id);
};

if (_condition isEqualTo {}) then {
  _condition = {true};
};

if (_id in GVAR(awaitingDialogueOptions)) then {
  _options append (GVAR(awaitingDialogueOptions) deleteAt _id);
};

if !(_initialMessage isEqualType []) then {
  _initialMessage = [_initialMessage];
};

if !(_initialMessage isEqualType []) then {
  _rejectionMessage = [_rejectionMessage];
};

GVAR(dialogues) set [
  _id,
  [
    _options,
    _uiTitle,
    _initialMessage,
    _condition,
    _rejectionMessage,
    _onStartClientEH,
    _onStartServerEH,
    _onEndClientEH,
    _onEndServerEH,
    _changeLogicFlag
  ]
];

_id
