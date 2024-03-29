#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers projectile for tracking
 */

params ["_projectile", "_startPos", "_magazine"];
TRACE_3("trackProjectile",_projectile,_startPos,_magazine);

if (
  (isNull _projectile) ||
  {GVAR(activeRadars) isEqualTo []}
) exitWith {};

private _dir = getDir _projectile;

_projectile addEventHandler ["deleted", {
  _this call FUNC(handleProjectileDeleted);
}];

private _id = GVAR(shellCounter) + 1;
GVAR(shellCounter) = _id;

private _textId = str _id;
private _textIdLen = count _textId;
if (_textIdLen < 5) then {
  _textId = _textId insert [0, "0000" select [0, 5 - _textIdLen]];
};

private _type = "";

if (_magazine in GVAR(magShellTypeCache)) then {
  _type = GVAR(magShellTypeCache) get _magazine;
} else {
  private _magArray = _magazine splitString "_";
  private _magIndex = _magArray findIf {
    private _c = count _x;
    (((_x select [_c - 2]) == "mm") && {_c > 3}) ||
    {((str (parseNumber _x)) == _x) && {_c > 1}}
  };

  if (_magIndex != -1) then {
    _type = _magArray select _magIndex;
    if !("mm" in _type) then {
      _type = _type + "mm";
    };
  };

  GVAR(magShellTypeCache) set [_magazine, _type];
};

private _index = GVAR(radarProjectiles) pushBack [
  _projectile, _textId, _startPos, _dir, [], _type
];
if (_index >= RADAR_PROJECTILES_LIMIT) then {GVAR(radarProjectiles) deleteAt 0;};

[QGVAR(radarProjectilesUpdated), _projectile] call CBA_fnc_localEvent;

if ((CBA_missionTime - GVAR(lastRadarSignalTime)) > RADAR_SIGNAL_TIMEOUT) then {
  GVAR(lastRadarSignalTime) = CBA_missionTime;
  {
    playSound3D ["A3\Sounds_F\missions\invalidcoords.ogg", _x, false, getPosASL _x, 2, 1, 200];
  } forEach GVAR(activeRadars);
};
