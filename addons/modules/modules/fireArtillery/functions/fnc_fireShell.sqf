#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR()
/*
 * Author: SzwedzikPL
 * Fires shell for fireArtillery module
 */

params ["_ammoCat", "_ammo", "_targetPos", "_distance", "_shellParams"];

LOG_2("Firing fireArtillery shell (ammo: %1 targetPos: %2)",str _ammo,str _targetPos);

// Art shells, grenades, bombs
if (_ammoCat in [0, 1, 5]) exitWith {
  private _shellPos = _targetPos vectorAdd [0, 0, _distance];
  private _shell = createVehicle [_ammo, _shellPos, [], 0, "CAN_COLLIDE"];
  _shell setPos _shellPos;
  _shell setVelocity [0, 0, -120];
  if (_ammoCat isEqualTo 5) then {
    _shell setVectorUp [0 , 0, -1];
  };
};

// Guided & unguided rockets
if (_ammoCat in [2, 3]) exitWith {
  _shellParams params ["_distanceW", "_distanceH", "_shellDir", "_shellAngle"];

  // Get shell spawn pos
  private _shellPos = _targetPos getPos [_distanceW, _hitDir];
  _shellPos set [2, (_shellPos # 2) + _distanceH];

  // Spawn shell
  private _shell = createVehicle [_ammo, _shellPos, [], 0, "CAN_COLLIDE"];

  // Setup rocket in next frame
  [{
    params ["_ammoCat", "_shell", "_shellPos", "_shellDir", "_shellAngle", "_targetPos"];
    _shell setPos _shellPos;
    _shell setDir _shellDir;
    _shell setVectorDirAndUp ([[vectorDirVisual _shell, vectorUpVisual _shell], 0, 90 - _shellAngle, 0] call BIS_fnc_transformVectorDirAndUp);

    if (_ammoCat isEqualTo 3) exitWith {
      _shell setMissileTargetPos _targetPos;
    };
    if ("R_230mm" in (typeOf _shell)) exitWith {
      // Setup velocity for 230mm rockets
      _shell setVelocityModelSpace [0, 550, 0];
    };
  }, [_ammoCat, _shell, _shellPos, _shellDir, _shellAngle, _targetPos]] call CBA_fnc_execNextFrame;
};

// Cruise missile
if (_ammoCat isEqualTo 4) exitWith {
  _shellParams params ["_hitDir"];

  private _launcherPos = _targetPos getPos [_distance * 1.2, _hitDir + 180];
  _launcherPos set [2, (_launcherPos # 2) + 3500];
  private _launcher = createVehicle ["B_Ship_MRLS_01_F", _launcherPos, [], 0, "CAN_COLLIDE"];
  _launcher setPos _launcherPos;
  _launcher enableSimulationGlobal false;
  _launcher hideObjectGlobal true;
  _launcher setVectorUp [0 , 0, -1];

  // Create UAV AI
  private _group = createGroup [civilian, true];
  "B_UAV_AI" createUnit [
    _launcherPos,
    _group,
    "",
    1
  ];

  // Move AI in launcher
  private _gunner = (units _group) # 0;
  _gunner moveInGunner _launcher;

  // Setup proper magazine
  private _muzzle = (_launcher weaponsTurret [0]) param [0, ""];
  [_launcher, [0], _muzzle, _ammo] call EFUNC(common,loadMagazineInstantly);

  // Create target
  private _target = createVehicle ["Land_HelipadEmpty_F" , _targetPos, [], 0, "CAN_COLLIDE"];
  _target setPos _targetPos;

  // Save target in launcher for cleanup
  _launcher setVariable [QGVAR(target), _target];

  // Add fired eh
  _launcher addEventHandler ["fired", {
    params ["_launcher", "", "", "", "", "", "_missile"];

    // Make sure launcher won't fire again
    _launcher setVehicleAmmoDef 0;

    [_launcher, _missile] spawn {
      params ["_launcher", "_missile"];

      // Wait until missile hit
      waitUntil {sleep 0.5;isNull _missile};

      // Cleanup launcher, gunner, group and target
      private _target = _launcher getVariable [QGVAR(target), objNull];
      private _gunner = gunner _launcher;
      private _group = group _gunner;

      deleteVehicle _target;
      deleteVehicle _gunner;
      deleteGroup _group;
      deleteVehicle _launcher;
    };
  }];

  // Report target and fire
  civilian reportRemoteTarget [_target, 3600];
  _launcher setWeaponReloadingTime [gunner _launcher, _muzzle, 0];
  _launcher fireAtTarget [_target, _muzzle];
};
