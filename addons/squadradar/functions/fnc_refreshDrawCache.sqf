#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes draw cache
 */

BEGIN_COUNTER(refreshDrawCache);

// Max distance for sprinting unit is 1.3m in 0.25 seconds
private _maxDistance = RADAR_MAX_UNIT_DISTANCE + 1.3;
private _specialStateUnits = [];

// Radar draw cache of squad members in range
private _playerData = [];
private _unitsData = [];

{
  _x params ["_unit", "_icons", "_colors", "_isSpecialState"];

  if (_unit isEqualTo ace_player) then {
    private _color = (_colors # 0) # 0;
    _playerData = [_icons # 0, [_color # 0, _color # 1, _color # 2, 1]];
  } else {
    private _distance = _unit distance ace_player;
    private _showSpecialState = false;
    if ((_distance < RADAR_MAX_UNIT_DISTANCE) && {_isSpecialState}) then {
      private _camDirVector = getCameraViewDirection ace_player;
      private _camDir = (_camDirVector # 0) atan2 (_camDirVector # 1);
      if (_camDir < 0) then {_camDir = 360 + _camDir};
      private _camDirDiff = abs (_camDir - (ace_player getDir _unit));

      if (_camDirDiff < 46) then {
        private _intersections = lineIntersectsSurfaces [eyePos ace_player, (getPosASL _unit) vectorAdd [0, 0, 0.5], ace_player, _unit];

        if (_intersections isEqualTo []) then {
          _showSpecialState = true;
          _specialStateUnits pushBack _unit;
        };
      };
    };

    // Update members cache for memberlist draw
    _x set [4, _showSpecialState];

    if (_distance < _maxDistance) then {
      _unitsData pushBack [
        _unit,
        _icons select _showSpecialState,
        (_colors select _showSpecialState) # 0,
        _showSpecialState
      ];
    };
  };
} forEach GVAR(membersCache);

GVAR(radarDrawCache) = [_playerData, _unitsData];

// Redraw memberlist if special state units in range changed
if !(_specialStateUnits isEqualTo GVAR(lastSpecialStateUnits)) then {
  GVAR(lastSpecialStateUnits) = _specialStateUnits;
  false call FUNC(drawMemberlist);
};

END_COUNTER(refreshDrawCache);
