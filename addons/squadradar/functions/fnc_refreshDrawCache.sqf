#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes draw cache
 */

BEGIN_COUNTER(refreshDrawCache);

private _specialStateUnits = [];
private _playerData = [];
private _unitsData = [];

{
  _x params ["_unit", "_icons", "_colors", "_isSpecialState", "", "_checkFOV"];

  if !(_unit isEqualTo ace_player) then {
    private _distance = _unit distance ace_player;
    private _showSpecialState = false;
    if (_isSpecialState && {_distance < RADAR_MAX_UNIT_DISTANCE}) then {
      if (_checkFOV) then {
        private _camDirVector = getCameraViewDirection ace_player;
        private _camDir = (_camDirVector # 0) atan2 (_camDirVector # 1);
        if (_camDir < 0) then {_camDir = 360 + _camDir};

        if ((abs (_camDir - (ace_player getDir _unit))) < 46) then {
          if (
            lineIntersectsSurfaces [
              eyePos ace_player,
              (getPosASL _unit) vectorAdd [0, 0, 0.5],
              ace_player,
              _unit
            ] isEqualTo []
          ) then {
            _showSpecialState = true;
            _specialStateUnits pushBack _unit;
          };
        };
      } else {
        _showSpecialState = true;
        _specialStateUnits pushBack _unit;
      };
    };

    // Update members cache for memberlist draw
    _x set [4, _showSpecialState];

    // Max distance for sprinting unit (without gear) is 1.7m in 0.25 seconds
    if (_distance < (RADAR_MAX_UNIT_DISTANCE + 0.85)) then {
      _unitsData pushBack [
        _unit,
        _icons select _showSpecialState,
        (_colors select _showSpecialState) # 0,
        _showSpecialState
      ];
    };
  } else {
    private _color = (_colors # 0) # 0;
    _color set [3, GVAR(radarIconsOpacity)];
    _playerData = [_icons # 0, _color];
  };
} forEach GVAR(membersCache);

GVAR(radarDrawCache) = [_playerData, _unitsData];

// Redraw memberlist if special state units in range changed
if !(_specialStateUnits isEqualTo GVAR(lastSpecialStateUnits)) then {
  GVAR(lastSpecialStateUnits) = _specialStateUnits;
  false call FUNC(drawMemberlist);
};

END_COUNTER(refreshDrawCache);
