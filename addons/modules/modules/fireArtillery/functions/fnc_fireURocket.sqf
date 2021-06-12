#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Fires unguided rocket for fireArtillery module
 */

params ["_ammo", "_targetPos", "_showDebug", "_params"];
TRACE_4("fireArtillery_fireURocket",_ammo,_targetPos,_showDebug,_params);
_params params ["_direction", "_distance", "_height", "_dropAngle"];

private _shellPos = (AGLtoASL (_targetPos getPos [_distance, _direction])) vectorAdd [0, 0, _height];
private _shellDir = _direction + 180;
private _shell = createVehicle [_ammo, [0, 0, 1500], [], 0, "CAN_COLLIDE"];
_shell setPosASL _shellPos;
_shell setDir _shellDir;
_shell setVectorDirAndUp ([[vectorDirVisual _shell, vectorUpVisual _shell], 0, _dropAngle, 0] call BIS_fnc_transformVectorDirAndUp);

if ("R_230mm" in _ammo) then {
  _shell setVelocityModelSpace [0, 550, 0];
};

if (is3DENPreview && {_showDebug}) then {
  _shell spawn FUNC(fireArtillery_showProjectileDebug);
};
