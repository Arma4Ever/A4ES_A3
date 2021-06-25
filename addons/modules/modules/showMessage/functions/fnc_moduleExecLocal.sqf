#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * showMessage module local exec function
 */

params ["_type", "_typeArgs"];
TRACE_2("showMessage_moduleExecLocal",_type,_typeArgs);

if !(hasInterface) exitWith {};

// Hint
if (_type isEqualTo 0) exitWith {
  _typeArgs params ["_message", "_playSound"];
  private _text = parseText format ["<t size='1.5'>%1</t>", _message call EFUNC(common,localize)];

  if (_playSound) then {
    hint _text;
  } else {
    hintSilent _text;
  };
};

// Top/Bottom text
if (_type in [1, 2]) exitWith {
  _typeArgs params ["_message", "_playSound"];
  [
    [_message call EFUNC(common,localize)],
    safeZoneX,
    safeZoneH / ([1.5, 16] select (_type - 1)),
    true,
    "<t font='PuristaBold'>%1</t>",
    [],
    {false},
    _playSound
  ] spawn BIS_fnc_typeText2;
};

// Subtitle
if (_type isEqualTo 3) exitWith {
  _typeArgs params ["_name", "_message"];
  [
    _name call EFUNC(common,localize),
    _message call EFUNC(common,localize)
  ] spawn BIS_fnc_showSubtitle;
};

// Confirm box
if (_type isEqualTo 4) exitWith {
  _typeArgs params ["_title", "_message"];
  [
    parseText (_message call EFUNC(common,localize)),
    _title call EFUNC(common,localize),
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
};
