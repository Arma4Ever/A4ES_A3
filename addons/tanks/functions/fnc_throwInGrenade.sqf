#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Throws grenade in target tank
 */

[2.5, _this, {
  (_this # 0) params ["_target", "_player", "_magazine"];

  // Play hand anim
  _player playActionNow "ThrowGrenade";

  // Remove used grenade from player
  _player removeItem _magazine;

  // Play dropping sound
  playSound3D [
    format ["A3\Sounds_F\weapons\Grenades\handgrenade_drops\handg_drop_metal_%1.wss", ceil (random 4)],
    _target
  ];

  // Show confirmation message
  [LLSTRING(GrenadeThrownIn), 2] call ACEFUNC(common,displayTextStructured);

  // Schedule explosion in 5 sec
  [{
    params ["_target"];

    // Make small explosion inside tank
    private _bomb =  createVehicle ["APERSTripMine_Wire_Ammo", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    if !(isNull _bomb) then {
      _bomb attachTo [_target, [0, 0, -1]];
      _bomb setDamage 1;
    };

    // Kill crew
    {_x setDamage 1} forEach (crew _target);

    // Send event damaging tank
    [QGVAR(thrownInGrenadeExplosion), _target, _target] call CBA_fnc_targetEvent;
  }, _target, 5] call CBA_fnc_waitAndExecute;
}, {}, LLSTRING(ThrowInGrenade_progress), {true}] call ACEFUNC(common,progressBar);
