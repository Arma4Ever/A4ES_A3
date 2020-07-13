#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(fireArtillery)
/*
 * Author: SzwedzikPL
 * fireArtillery module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Mark module as executed to prevent future executions
_logic setVariable [QGVAR(executed), true, true];

// Get logic area
private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

// Pos mode
private _targetPosMode = _logic getVariable [QGVAR(targetPosMode), 0];

// Get shells delay
private _shellsDelay = [
  _logic getVariable [QGVAR(shellsMinDelay), 2],
  _logic getVariable [QGVAR(shellsMidDelay), 4],
  _logic getVariable [QGVAR(shellsMaxDelay), 6]
];

// Salvos data
private _salvos = _logic getVariable [QGVAR(salvos), false];
private _salvosShellCount = if (_salvos) then {
  _logic getVariable [QGVAR(salvoShellsCount), 1]
} else {1};
private _salvosDelay = if (_salvos) then {
  [
    _logic getVariable [QGVAR(salvosMinDelay), 2],
    _logic getVariable [QGVAR(salvosMidDelay), 4],
    _logic getVariable [QGVAR(salvosMaxDelay), 6]
  ]
} else {0};

// Get condition data
private _timer = _logic getVariable [QGVAR(timer), 10];
private _shellsCount = _logic getVariable [QGVAR(shellsCount), 1];
private _salvosCount = _logic getVariable [QGVAR(salvosCount), 1];

// Prep counters
private _firedShots = 0;
private _firedSalvos = 0;
private _startTime = CBA_missionTime;

// Generate condition
private _conditionType = _logic getVariable [QGVAR(conditionType), 0];
private _condition = compile (switch _conditionType do {
  case 0: {
    "(CBA_missionTime - _startTime) < _timer"
  };
  case 1: {
    [
      "_firedShots < _shellsCount",
      "_firedSalvos < _salvosCount"
    ] select _salvos
  };
  case 2: {
    _logic getVariable [QGVAR(condition), "true"]
  };
});

// Get common params
private _ammoCat = _logic getVariable [QGVAR(ammoCat), 0];
private _distance = 3000;
private _hitDir = _logic getVariable [QGVAR(hitDir), 0];

// Prep shell params
private _shellParams = switch (_ammoCat) do {
    // Prep shell params for guided and unguided rockets
    case 2;
    case 3: {
      private _hitAngle = _logic getVariable [QGVAR(hitAngle), 90];

      // Get shell angle and dir
      private _shellAngle = 90 - _hitAngle;
      private _shellDir = _hitDir + 180;

      // Calc distance width and height
      private _angleCos = (cos _hitAngle) max 0;
      private _distanceW = _distance * _angleCos;
      private _distanceH = _distance * (sin _hitAngle);

      // Add drop correction if unguided rocket
      if (_ammoCat isEqualTo 2) then {
        // Adjust height for rocket drop, it's good enough, won't be accurate in 100% cases
        _distanceH = _distanceH + ((_distanceH * 0.0386) * _angleCos);
      };

      [_distanceW, _distanceH, _shellDir, _shellAngle];
    };
    // Prep shell params for cruise missiles
    case 4: {
      [_hitDir]
    };
    default {[]};
};

// Prep fireShell function params
private _targetPos = +(_logicArea # 0);
_targetPos set [2, 0];
private _fireShellParams = [
  _ammoCat,
  _logic getVariable [format [QGVAR(ammo_%1), _ammoCat], "Sh_82mm_AMOS"],
  _targetPos,
  _distance,
  _shellParams
];

// Start shelling
while _condition do {
  for "_i" from 1 to _salvosShellCount do {
    if (_targetPosMode isEqualTo 0) then {
      // Update target pos if in area mode
      _targetPos = _logicArea call EFUNC(common,getAreaRandomPos);
      _targetPos set [2, 0];
      _fireShellParams set [2, _targetPos];
    };
    // Fire shell
    _fireShellParams call FUNC(fireArtillery_fireShell);

    // Count shells if not in salvos mode
    if !(_salvos) then {
      _firedShots = _firedShots + 1;
    };

    // Wait for next shell
    sleep (random _shellsDelay);
  };
  // Count salvos if in salvos mode
  if (_salvos) then {
    _firedSalvos = _firedSalvos + 1;
    sleep (random _salvosDelay);
  };
};

LOG('Execution of EXEC_MODULE_NAME finished.');

true
