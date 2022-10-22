#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

/*

- Default dla cywili
- Skróty

*/


[QGVAR(talkStart), {
  params ["_unit", "_player"];

  private _enablePATH = _unit checkAIFeature "PATH";
  _unit setVariable [QGVAR(enablePATH), _enablePATH];

  if (_enablePATH) then {
    _unit disableAI "PATH";
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(talkEnd), {
  params ["_unit"];

  private _enablePATH = _unit getVariable [QGVAR(enablePATH), true];
  if (_enablePATH) then {
    _unit enableAI "PATH";
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(randomLip), {
  params ["_unit", "_status"];
  _unit setRandomLip _status;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
  GVAR(dialoguesCache) = createHashMap;
  GVAR(optionsCache) = createHashMap;
  GVAR(answersCache) = createHashMap;

  GVAR(currentDialogue) = "";
  GVAR(currentAnswer) = "";

  GVAR(showingAnswer) = false;
  GVAR(answerShown) = false;
  GVAR(awaitingData) = false;

  GVAR(talkingWith) = objNull;
  GVAR(talkingCheckLoopPFH) = -1;

  [QGVAR(invalidateCache), {
    params ["_dialogues", "_options", "_answers"];

    {
      _x params ["_cache", "_ids"];
      {_cache deleteAt _x} forEach _ids;
    } forEach [
      [GVAR(dialoguesCache), _dialogues],
      [GVAR(optionsCache), _options],
      [GVAR(answersCache), _answers]
    ];

    0 call FUNC(requestMissingData);
  }] call CBA_fnc_addEventHandler;

  [QGVAR(requestedData), {
    params ["_dialoguesData", "_optionsData", "_answersData"];

    GVAR(dialoguesCache) merge [_dialoguesData, true];
    GVAR(optionsCache) merge [_optionsData, true];
    GVAR(answersCache) merge [_answersData, true];

    GVAR(awaitingData) = false;

    0 call FUNC(ui_update);
  }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
  GVAR(dialoguesCount) = 0;
  GVAR(optionsCount) = 0;
  GVAR(answersCount) = 0;

  GVAR(dialogues) = createHashMap;
  GVAR(options) = createHashMap;
  GVAR(answers) = createHashMap;

  GVAR(awaitingDialogueOptions) = createHashMap;
  GVAR(awaitingOptionAnswers) = createHashMap;
  GVAR(awaitingAnswerOptions) = createHashMap;

  [QGVAR(requestData), {
    _this call FUNC(returnServerData);
  }] call CBA_fnc_addEventHandler;

  [QGVAR(dialogueStarted), {

  }] call CBA_fnc_addEventHandler;

  [QGVAR(dialogueEnded), {

  }] call CBA_fnc_addEventHandler;

  [QGVAR(optionSelected), {
    
  }] call CBA_fnc_addEventHandler;

  [QGVAR(answerShown), {

  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
