#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Dialogue UI display unLoad handler
 */

params ["_display"];

uiNamespace setVariable [QGVAR(uiDisplay), displayNull];

private _currentDialogue = GVAR(currentDialogue);

if (_currentDialogue != "") then {
  if !(_currentDialogue in GVAR(dialoguesCache)) exitWith {};

    private _dialogue = GVAR(dialoguesCache) get _currentDialogue;
    if (_dialogue isEqualTo []) exitWith {closeDialog 0;};
    _dialogue params [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "_dialEndEH",
      "_dialEndSendServerEH"
    ];

    // Call dialogue ended client EH
    [player, _talkingWith, _currentDialogue] call _dialEndEH;

    // Call dialogue ended server EH
    if (_dialEndSendServerEH) then {
      [QGVAR(dialogueEnded), [player, _talkingWith, _currentDialogue]] call CBA_Fnc_serverEvent;
    };
};

if (GVAR(talkingCheckLoopPFH) != -1) then {
  [GVAR(talkingCheckLoopPFH)] call CBA_Fnc_removePerFrameHandler;
  GVAR(talkingCheckLoopPFH) = -1;
};

[GVAR(talkingWith), player] call FUNC(endTalk);

GVAR(talkingWith) = objNull;
GVAR(currentDialogue) = "";
GVAR(currentAnswer) = "";
GVAR(currentOption) = "";

GVAR(showingAnswer) = false;
GVAR(answerShown) = false;
