#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Animates jamming of given controls
 */

_this spawn {
  params ["_controls", "_exitCond"];
  private _exitCondFnc = compile _exitCond;
  {
    _x params ["_ctrlShow", "_delay"];
    if (call _exitCondFnc) exitWith {};
    {_x ctrlShow _ctrlShow;} forEach _controls;
    sleep _delay;
  } forEach [
    [false, 0.25],
    [true, 0.55],
    [false, 0.2],
    [true, 0.1],
    [false, 0.1],
    [true, 0.05],
    [false, 0.05],
    [true, 0.05],
    [false, 0.05],
    [true, 0.05],
    [false, 0]
  ];
};
