#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init markers shortcut buttons
 */
params ["_display", "_posX", "_posY", "_posW", "_posH", "_canTimestamp"];
TRACE_6("initInsertMarker",_display,_posX,_posY,_posW,_posH,_canTimestamp);

private _pos = [
  _posX + _posW,
  _posY - 1 * _posH,
  _posW,
  _posH
];

{
  _x params ["_title", "_params"];
  private _ctrl = _display displayCtrl (1710 + _forEachIndex);

  _ctrl setVariable [QGVAR(display), _display];
  _ctrl setVariable [QGVAR(params), _params];

  _pos set [1, _posY + (_forEachIndex - 1) * _posH];
  _ctrl ctrlSetPosition _pos;
  _ctrl ctrlSetText _title;
  _ctrl ctrlCommit 0;

  _ctrl ctrlAddEventHandler ["ButtonClick", {
    _this call FUNC(handleButtonClick);
  }];
} forEach [
  ["Piechota", ["o_inf", "ColorEAST", parseNumber _canTimestamp]],
  ["Piechota zmot.", ["o_motor_inf", "ColorEAST", parseNumber _canTimestamp]],
  ["Piechota zmech.", ["o_mech_inf", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Tank), ["o_armor", "ColorEAST", parseNumber _canTimestamp]],
  ["Artyleria", ["o_art", "ColorEAST", parseNumber _canTimestamp]],
  ["AA", ["o_antiair", "ColorEAST", parseNumber _canTimestamp]],
  ["Mina", ["loc_mine", "ColorEAST", parseNumber _canTimestamp]],
  ["Umocnienia", ["mil_triangle", "ColorEAST", parseNumber _canTimestamp]],
  ["Cel ogniowy", ["hd_Contact_pencilTask1", "ColorEAST", parseNumber _canTimestamp]],
  ["LZ", ["hd_Contact_circle4", "ColorBlack", 2]]
];
