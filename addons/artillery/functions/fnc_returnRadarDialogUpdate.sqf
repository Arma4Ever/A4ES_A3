#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns update for radar dialog
 */

params ["_unit"];
TRACE_1("returnRadarDialogUpdate",_unit);

private _data = [];

// Clean invalid radar projectiles
GVAR(radarProjectiles) = GVAR(radarProjectiles) select {
  !(isNull (_x # 0)) || {(_x # 4) isNotEqualTo []}
};

// Prep update data
{
  _x params ["_projectile", "_textId", "_startPos", "_dir", "_endPos", "_type"];

  private _distance = 0;
  if (isNull _projectile) then {
    if (_endPos isEqualTo []) exitWith {};
      _distance = _startPos distance2D _endPos;
  } else {
    _distance = _startPos distance2D _projectile;
    _dir = getDir _projectile;
  };

  _data pushBack [
    _textId,
    _type,
    _dir toFixed 1,
    _distance toFixed 2,
    isNull _projectile
  ];
} forEach GVAR(radarProjectiles);

// Reverse so newest projectiles will be first
reverse _data;

// Send update
[QGVAR(radarDialogUpdate), [_data, CBA_missionTime], [_unit]] call CBA_fnc_targetEvent;
