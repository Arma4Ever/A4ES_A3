#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles RscRadar map draw event
 */

params ["_control"];

BEGIN_COUNTER(drawRadar);

private _specialStateUnits = [];

private _cameraDirVector = (positionCameraToWorld [0, 0, 1]) vectorDiff (positionCameraToWorld [0, 0, 0]);
private _cameraDir = (_cameraDirVector # 0) atan2 (_cameraDirVector # 1);

{
  private _distance = _x distance ace_player;
  if (_distance < RADAR_MAX_UNIT_DISTANCE) then {
    private _icon = _x getVariable [QGVAR(icon), ""];
    private _color = (_x getVariable [QEGVAR(nametags,unitColor), [[1,1,1]]]) # 0;
    private _dir = 0;
    private _unitRelPos = GVAR(radarPos) getPos [_distance, ((ace_player getDir _x) - _cameraDir)];
    _unitRelPos set [2, 0];

    // If icon doesn't match baseIcon unit is in special state
    if !(_icon isEqualTo (_x getVariable [QGVAR(baseIcon), ""])) then {
      _specialStateUnits pushBack _x;
      _color = (_x getVariable [QGVAR(iconColor), [_color]]) # 0;
    } else {
      _dir = getDir _x;
    };

    _color set [3, linearConversion [RADAR_FADE_MIN_UNIT_DISTANCE, RADAR_MAX_UNIT_DISTANCE, _distance, 1, 0, true]];

    _control drawIcon [
      _icon,
      _color,
      _unitRelPos,
      20,
      20,
      _dir - _cameraDir,
      ""
    ];
  };
} forEach GVAR(currentSquadUnitsRadar);

// redraw memberlist if units with special states changed
if !(GVAR(lastSpecialStateUnits) isEqualTo _specialStateUnits) then {
  false call FUNC(drawMemberlist);
  GVAR(lastSpecialStateUnits) = _specialStateUnits;
};

END_COUNTER(drawRadar);
