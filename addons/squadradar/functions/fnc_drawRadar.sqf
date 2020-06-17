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
  _x params ["_unit", "_icon", "_color", "_showSpecialState"];

  private _distance = _unit distance ace_player;

  // Fade icons on edges
  _color set [3, linearConversion [RADAR_FADE_MIN_UNIT_DISTANCE, RADAR_MAX_UNIT_DISTANCE, _distance, GVAR(radarIconsOpacity), 0, true]];

  _control drawIcon [
    _icon,
    _color,
    GVAR(radarPos) getPos [_distance, ((ace_player getDir _unit) - _cameraDir)],
    GVAR(radarIconSize),
    GVAR(radarIconSize),
    // Don't rotate special state icons
    // Use if instead of [] select x because all elements of [] are calculated before select
    if !(_showSpecialState) then {((getDir _unit) - _cameraDir)} else {0},
    ""
  ];
} forEach (GVAR(radarDrawCache) # 1);

private _playerData = GVAR(radarDrawCache) # 0;
_playerData params ["_icon", "_color"];

_control drawIcon [
  _icon,
  _color,
  GVAR(radarPos),
  GVAR(radarIconSize),
  GVAR(radarIconSize),
  ((getDir ace_player) - _cameraDir),
  ""
];

END_COUNTER(drawRadar);
