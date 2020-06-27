#include "script_component.hpp"
/*
 * Author: Commy2, SzwedzikPL
 * Returns random pos inside given area
 */

params ["_center", "_x", "_y", "_angle", "_isRectangle"];

BEGIN_COUNTER(getAreaRandomPos);

private "_position";

// Get random pos inside area
while {
  _position = _center vectorAdd [_x * (random 2 - 1), _y * (random 2 - 1), 0];
  !(_position inArea [_center, _x, _y, 0, _isRectangle])
} do {};

// Return pos rotated to correct angle
_center getPos [
  _position distance2D _center,
  (_center getDir _position) + _angle
]

END_COUNTER(getAreaRandomPos);
