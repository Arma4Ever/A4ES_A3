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
  [LLSTRING(Inf), ["o_inf", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Inf_mot), ["o_motor_inf", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Inf_mech), ["o_mech_inf", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Tank), ["o_armor", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Art), ["o_art", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(AA), ["o_antiair", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Mine), ["loc_mine", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Def), ["mil_triangle", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(Target), ["hd_Contact_pencilTask1", "ColorEAST", parseNumber _canTimestamp]],
  [LLSTRING(LZ), ["hd_Contact_circle4", "ColorBlack", 2]]
];
