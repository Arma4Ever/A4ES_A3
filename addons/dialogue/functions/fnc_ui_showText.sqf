#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows given text answer on dialogue UI
 */

params ["_text"];

private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];
if (isNull _display) exitWith {};

GVAR(showingAnswer) = true;
GVAR(answerShown) = false;

0 call FUNC(ui_disableOptions);

private _textSegments = [];

_text = _text call EFUNC(common,localize);

private _index = _text find "\r";
if (_index == -1) then {
  _textSegments pushBack _text;
} else {
  while {_index != -1} do {
    _textSegments pushBack (_text select [0, _index]);
    _text = _text select [_index + 2];
    _index = _text find "\r";
  };
  _textSegments pushBack _text;
};

_textSegments spawn {
  private _display = uiNamespace getVariable [QGVAR(uiDisplay), displayNull];
  if (isNull _display) exitWith {};

  private _ctrlText = _display displayCtrl IDC_DIALOGUE_UI_TEXT;
  private _currentText = "";

  {
    forceUnicode 1;
    private _chars = _x splitString "";

    {
      if (isNull _ctrlText) exitWith {};
      _currentText = _currentText + _x;
      _ctrlText ctrlSetStructuredText parseText _currentText;

      // Most people read at an average rate of 250 words per minute
      // Average length of polish word is 6 chars - ref: https://digijournals.uni.lodz.pl/cgi/viewcontent.cgi?article=1010&context=kpc
      // (250x6)/60 = 25 chars / s = 1 char / 40ms
      sleep 0.04;
    } forEach _chars;

    if (isNull _ctrlText) exitWith {};
    _currentText = _currentText + "<br/>";
  } forEach _this;

  if (isNull _ctrlText) exitWith {};

  GVAR(showingAnswer) = false;
  GVAR(answerShown) = true;

  0 call FUNC(ui_update);
};
