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
  ["Piechota", ["o_inf", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Piechota zmot.", ["o_motor_inf", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Piechota zmech.", ["o_mech_inf", "ColorEAST", [0, 1] select _canTimestamp]],
  [LLSTRING(Tank), ["o_armor", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Artyleria", ["o_art", "ColorEAST", [0, 1] select _canTimestamp]],
  ["AA", ["o_antiair", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Mina", ["loc_mine", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Umocnienia", ["mil_triangle", "ColorEAST", [0, 1] select _canTimestamp]],
  ["Cel ogniowy", ["hd_Contact_pencilTask1", "ColorEAST", [0, 1] select _canTimestamp]],
  ["LZ", ["hd_Contact_circle4", "ColorBlack", 2]]
];
