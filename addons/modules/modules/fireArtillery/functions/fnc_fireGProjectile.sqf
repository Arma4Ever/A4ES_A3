#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Fires guided projectile for fireArtillery module
 */

params ["_ammo", "_targetPos", "_showDebug", "_params"];
TRACE_4("fireArtillery_fireGProjectile",_ammo,_targetPos,_showDebug,_params);
_params params ["_direction", "_distance", "_height"];

// Get shell pos
private _shellPos = (AGLtoASL (_targetPos getPos [_distance, _direction])) vectorAdd [0, 0, _height];

// Correct missile angle so target pos is inside targeting cone
private _dist3D = sqrt ((_distance^2) + (_height^2));
private _angleDiff = asin (_height / _dist3D);

// Create shell
private _shell = createVehicle [_ammo, [0, 0, 1500], [], 0, "CAN_COLLIDE"];
_shell setPosASL _shellPos;
_shell setDir (_direction + 180);
_shell setVectorDirAndUp ([[vectorDirVisual _shell, vectorUpVisual _shell], 0, _angleDiff, 0] call BIS_fnc_transformVectorDirAndUp);
_shell setMissileTargetPos _targetPos;

// Debug
if (is3DENPreview && {_showDebug}) then {
  _shell spawn FUNC(fireArtillery_showProjectileDebug);
};
