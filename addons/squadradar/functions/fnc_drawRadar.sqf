#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles RscRadar map draw event
 */

params ["_control"];

BEGIN_COUNTER(drawRadar);

private _cameraDirVector = (positionCameraToWorld [0, 0, 1]) vectorDiff (positionCameraToWorld [0, 0, 0]);
private _cameraDir = (_cameraDirVector # 0) atan2 (_cameraDirVector # 1);

{
  _x params ["_unit", "_icon", "_color", "_isSpecialState"];

  private _distance = _unit distance ace_player;
  private _unitRelPos = GVAR(radarPos) getPos [_distance, ((ace_player getDir _unit) - _cameraDir)];

  // Fade icons on edges
  _color set [3, linearConversion [RADAR_FADE_MIN_UNIT_DISTANCE, RADAR_MAX_UNIT_DISTANCE, _distance, 1, 0, true]];

  _control drawIcon [
    _icon,
    _color,
    _unitRelPos,
    20,
    20,
    // Don't rotate special state icons
    // Use if instead of [] select x because all elements of [] are calculated before select
    if !(_isSpecialState) then {((getDir _unit) - _cameraDir)} else {0},
    ""
  ];
} forEach GVAR(radarDrawCache);

END_COUNTER(drawRadar);
