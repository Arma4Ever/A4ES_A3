#include "script_component.hpp"
/*
 * Author: ACE Team, SzwedzikPL
 * Returns list of area name tag targets data
 */


private _camPosAGL = positionCameraToWorld [0, 0, 0];
private _camPosASL = AGLToASL _camPosAGL;
private _areaTargets = (_camPosAGL nearObjects ["CAManBase", NAMETAG_3D_MAX_DISTANCE + 2]) select {
  _x != ACE_player &&
  {(lineIntersectsSurfaces [_camPosASL, eyePos _x, ACE_player, _x]) isEqualTo []} &&
  {!isObjectHidden _x} &&
  {_x call FUNC(shouldShowNameTag)}
};

private _targetsData = [];

{
  _targetsData pushBack (_x call FUNC(getUnitData));
} forEach _areaTargets;

_targetsData
