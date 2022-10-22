#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns forced option (persistent)
 */

params ["_options"];

private _currentDialogue = GVAR(currentDialogue);
private _talkingWith = GVAR(talkingWith);
private _persistentSelections = _talkingWith getVariable [QGVAR(persistentSelections), []];

private _option = "";

{
  _x params ["", "", "_condition", "_isPersistent", "", "", "", "_id"];

  if !([player, _talkingWith, _currentDialogue] call _condition) then {continue;};
  if (_isPersistent && {_id in _persistentSelections}) exitWith {
    _option = _id;
  };
} forEach _options;

_option
