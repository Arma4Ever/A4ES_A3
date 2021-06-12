
#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Drops shell for fireArtillery module
 */

params ["_ammo", "_targetPos", "_showDebug", "_params"];
TRACE_4("fireArtillery_dropShell",_ammo,_targetPos,_showDebug,_params);
_params params ["_height"];

private _shellPos = (AGLtoASL _targetPos) vectorAdd [0, 0, _height];
private _shell = createVehicle [_ammo, [0, 0, 1500], [], 0, "CAN_COLLIDE"];
_shell setPosASL _shellPos;
_shell setVelocity [0, 0, -120];

// Trigger flares
if ("ACE_40mm_Flare" in _ammo) then {
  _shell spawn {
    sleep 3;
    triggerAmmo _this;
  };
};

if (is3DENPreview && {_showDebug}) then {
  _shell spawn FUNC(fireArtillery_showProjectileDebug);
};
