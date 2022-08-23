#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles hide body action (scripted, action or arma garbage collector)
 */

params ["_unit"];

if ((animationState _this) != (_this getVariable QGVAR(anim))) then {
  private _anim = _this getVariable QGVAR(anim);
  _this switchMove _anim;
  [_this, _anim] remoteExecCall ["switchMove", 0, false];
};
