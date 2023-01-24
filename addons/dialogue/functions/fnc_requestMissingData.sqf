#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if dialogue data are missing, sends request to server if needed
 */

if (GVAR(awaitingData)) exitWith {true};
if (GVAR(currentDialogue) == "") exitWith {false};

private _dialoguesCache = GVAR(dialoguesCache);

if (!(GVAR(currentDialogue) in _dialoguesCache)) exitWith {
  GVAR(awaitingData) = true;
  [QGVAR(requestData), [[GVAR(currentDialogue)], [], []]] call CBA_Fnc_serverEvent;
  true
};

private _optionsCache = GVAR(optionsCache);
private _missingOptions = [];
private _missingAnswers = [];

if (GVAR(currentAnswer) == "") then {
  private _dialogueOptions = (_dialoguesCache get GVAR(currentDialogue)) # 0;
  {
    if !(_x in _optionsCache) then {
      _missingOptions pushBackUnique _x;
    };
  } forEach _dialogueOptions;
} else {
  private _answerOptions = (GVAR(answersCache) get GVAR(currentAnswer)) # 0;
  {
    if !(_x in _optionsCache) then {
      _missingOptions pushBackUnique _x;
    } else {
      // GET OPTION ANSWER LINK, IF MISSING, ADD IT
    };
  } forEach _answerOptions;
};

if (_missingOptions isNotEqualTo []) exitWith {
  [QGVAR(requestData), [[], _missingOptions, _missingAnswers]] call CBA_Fnc_serverEvent;

  true
};

false
