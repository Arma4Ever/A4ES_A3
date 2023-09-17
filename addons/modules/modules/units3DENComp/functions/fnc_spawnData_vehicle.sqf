#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns vehicle from vehicle data during game
 */

params ["_vehicleData", "_vehiclesDynSim", "_clearVehCargo", "_vehiclePostInit"];
TRACE_1("units3DENComp_spawnData_vehicle",_vehicleData);

_vehicleData params [
  "_className",
  "_posATL",
  "",
  "_vectors",
  "_disableRandomization",
  "_texture",
  "_animations",
  "_dynamicSimulation",
  "_reportRemoteTargets",
  "_receiveRemoteTargets",
  "_reportOwnPosition",
  "_radarUsageAI",
  "_aceCookoffEnable",
  "_aceCookoffEnableAmmoCookoff",
  "_engineOn",
  "_enableHeadlights"
];

private _special = "CAN_COLLIDE";

if (_className isKindOf "Air") then {
  private _posASL = ATLToASL _posATL;
  private _intersects = lineIntersectsSurfaces [
    _posASL,
    _posASL vectorAdd [0, 0, -4],
    objNull,
    objNull
  ];
  if (
    (_intersects isNotEqualTo []) ||
    {(([_posATL, _posASL] select (surfaceIsWater _posATL)) # 2) < 6}
  ) exitWith {};

  _special = "FLY";
};

private _vehicle = createVehicle [_className, ASLToAGL (ATLToASL _posATL), [], 0, _special];

_vehicle allowDamage false;

_vehicle setPosATL _posATL;
_vehicle setVectorDirAndUp _vectors;

// Remote targets & radar
_vehicle setVehicleReportRemoteTargets _reportRemoteTargets;
_vehicle setVehicleReceiveRemoteTargets _receiveRemoteTargets;
_vehicle setVehicleReportOwnPosition _reportOwnPosition;
_vehicle setVehicleRadar _radarUsageAI;

// Cookoff
if !(_aceCookoffEnable) then {_vehicle setVariable [QACEGVAR(cookoff,enable), false, true];};
if !(_aceCookoffEnableAmmoCookoff) then {_vehicle setVariable [QACEGVAR(cookoff,enableAmmoCookoff), false, true];};

// Texture
if (_texture isNotEqualTo "") then {
  private _textures = getArray ((configOf _vehicle) >> "TextureSources" >> _texture >> "textures");

  {
    _vehicle setObjectTextureGlobal [_forEachIndex, _x];
  } forEach _textures;
};

// Anims
if (_animations isNotEqualTo []) then {
  if ((_animations # 0) isEqualType []) then {
    {
      _vehicle animate [_x # 0, _x # 1, true];
    } forEach _animations;
  } else {
    private _to = (count _animations) - 1;
    for "_i" from 0 to _to step 2 do {
      private _animation = _animations param [_i, ""];
      private _phase = _animations param [_i + 1, -1];

      if ((_animation isEqualTo "") || (_phase == -1)) then {continue};
      _vehicle animate [_animation, _phase, true];
    };
  };
};

// Engine
if (_engineOn) then {
  _vehicle engineOn true;
};

// Headlights
if (_enableHeadlights) then {
  _vehicle setPilotLight true;
};

// Cargo
if (_clearVehCargo) then {
  clearWeaponCargoGlobal _vehicle;
  clearMagazineCargoGlobal _vehicle;
  clearItemCargoGlobal _vehicle;
};

// Dynamic simulation
if (
  (_vehiclesDynSim isEqualTo 1) ||
  {(_vehiclesDynSim isEqualTo 0) && _dynamicSimulation}
) then {
  // Add delay to ensure proper init & sync of all vehicles
  [{
    [QEGVAR(common,enableDynSim), _this] call CBA_fnc_serverEvent;
  }, [_vehicle], 5] call CBA_fnc_waitAndExecute;
};

// Call post init
[_vehicle, _vehiclePostInit] spawn {
  params ["_vehicle", "_vehiclePostInit"];
  sleep 1;
  _vehicle allowDamage true;
  _vehicle call _vehiclePostInit;
};

_vehicle
