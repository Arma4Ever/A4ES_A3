#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns server data about given dialogues, options and answers in client format
 */

params ["_player", "_dialogues", "_options", "_answers"];

private _dialoguesData = createHashMap;
private _optionsData = createHashMap;
private _answersData = createHashMap;

{
  private _id = _x;
  private _data = GVAR(dialogues) getOrDefault [_id, []];
  if (_data isEqualTo []) then {
    _dialoguesData set [_id, []];
    continue;
  };

  _data params [
    "_dialOptions",
    "_uiTitle",
    "_initialMessage",
    "_condition",
    "_rejectionMessage",
    "_onStartClientEH",
    "_onStartServerEH",
    "_onEndClientEH",
    "_onEndServerEH",
    "_changeLogicFlag"
  ];

  // Extend requested options to also include requested dialog options
  _options append _dialOptions;

  _dialoguesData set [_id, [
    _dialOptions,
    _uiTitle,
    _initialMessage,
    _condition,
    _rejectionMessage,
    _onStartClientEH,
    ((_onStartServerEH isNotEqualTo {}) || {_changeLogicFlag isNotEqualTo []}),
    _onEndClientEH,
    _onEndServerEH isEqualTo {}
  ]];
} forEach _dialogues;

{
  private _id = _x;
  private _data = GVAR(options) getOrDefault [_id, []];
  if (_data isEqualTo []) then {
    _optionsData set [_id, []];
    continue;
  };

  _data params [
    "_optionAnswers",
    "_text",
    "_condition",
    "_isPersistent",
    "_answerLink",
    "_onSelectClientEH",
    "_onSelectServerEH",
    "_changeLogicFlag"
  ];

  // Extend requested anwers to also include requested option answers
  _answers append _optionAnswers;

  // Extend requested answers to also include requested option link answer
  if (_answerLink != "") then {
    _answers pushBackUnique _answerLink;
  };

  _optionsData set [_id, [
    _optionAnswers,
    _text,
    _condition,
    _isPersistent,
    _answerLink,
    _onSelectClientEH,
    ((_onSelectServerEH isNotEqualTo {}) || {_changeLogicFlag isNotEqualTo []}),
    _id
  ]];
} forEach _options;

{
  private _id = _x;
  private _data = GVAR(answers) getOrDefault [_id, []];
  if (_data isEqualTo []) then {
    _answersData set [_id, []];
    continue;
  };

  _data params [
    "_answOptions",
    "_text",
    "_condition",
    "_onShowClientEH",
    "_onShowServerEH",
    "_changeLogicFlag"
  ];

  _answersData set [_id, [
    _answOptions,
    _text,
    _condition,
    _onShowClientEH,
    ((_onShowServerEH isNotEqualTo {}) || {_changeLogicFlag isNotEqualTo []}),
    _id
  ]];
} forEach _answers;

[QGVAR(requestedData), [_dialoguesData, _optionsData, _answersData], [_player]] call CBA_fnc_targetEvent;
