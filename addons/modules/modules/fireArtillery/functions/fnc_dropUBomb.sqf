
#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Drops unguided bomb for fireArtillery module
 */

params ["_ammo", "_targetPos", "_showDebug", "_params"];
TRACE_4("fireArtillery_dropUBomb",_ammo,_targetPos,_showDebug,_params);
_params params ["_height"];

private _shellPos = (AGLtoASL _targetPos) vectorAdd [0, 0, _height];
private _shell = createVehicle [_ammo, [0, 0, 1500], [], 0, "CAN_COLLIDE"];
_shell setPosASL _shellPos;
_shell setVectorDirAndUp ([[vectorDirVisual _shell, vectorUpVisual _shell], 0, -90, 0] call BIS_fnc_transformVectorDirAndUp);
_shell setVelocity [0, 0, -240];

// Debug
if (is3DENPreview && {_showDebug}) then {
  _shell spawn FUNC(fireArtillery_showProjectileDebug);
};
