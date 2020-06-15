#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes radar draw cache
 */

BEGIN_COUNTER(refreshRadarDrawCache);

// Max distance for sprinting unit is 1.3m in 0.25 seconds
private _maxDistance = RADAR_MAX_UNIT_DISTANCE + 1.3;
private _specialStateUnits = [];

// Radar draw cache of squad members in range
GVAR(radarDrawCache) = GVAR(radarMembersCache) select {
  _x params ["_unit", "", "", "_isSpecialState"];
  private _inRange = (_unit distance ace_player) < _maxDistance;
  if (_inRange && {_isSpecialState}) then {
    _specialStateUnits pushBack _unit;
  };
  _inRange
};

// Redraw memberlist if special state units in range changed
if !(_specialStateUnits isEqualTo GVAR(lastSpecialStateUnits)) then {
  GVAR(lastSpecialStateUnits) = _specialStateUnits;
  false call FUNC(drawMemberlist);
};

END_COUNTER(refreshRadarDrawCache);
