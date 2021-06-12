#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * fireArtillery module exec function
 */

params ["_logic"];
TRACE_1("fireArtillery_moduleExecSpawn",_logic);

if (isNull _logic || {!isServer}) exitWith {};

// Get logic area
private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

// Target pos params
private _targetPos = getPos _logic;
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

// Get common params
private _showDebug = _logic getVariable [QGVAR(showDebug), false];
private _ammoCat = _logic getVariable [QGVAR(ammoCat), 0];
private _ammoType = [
  _logic getVariable [QGVAR(ammoType_artillery), "Sh_82mm_AMOS"],
  _logic getVariable [QGVAR(ammoType_grenades), "G_20mm_HE"],
  _logic getVariable [QGVAR(ammoType_rockets), "R_60mm_HE"],
  _logic getVariable [QGVAR(ammoType_missiles), "M_Jian_AT"],
  _logic getVariable [QGVAR(ammoType_gBombs), QGVAR(manual_GBU12)],
  _logic getVariable [QGVAR(ammoType_uBombs), "Bo_Mk82"]
] select _ammoCat;

private _distance = _logic getVariable [QGVAR(shellDistance), 0];
private _height = _logic getVariable [QGVAR(shellHeight), 0];
private _direction = _logic getVariable [QGVAR(hitDir), 0];
private _dropAngle = _logic getVariable [QGVAR(dropAngle), 45];

private _fireFunction = missionNamespace getVariable ([
  QFUNC(fireArtillery_dropShell),
  QFUNC(fireArtillery_dropShell),
  QFUNC(fireArtillery_fireURocket),
  QFUNC(fireArtillery_fireGProjectile),
  QFUNC(fireArtillery_fireGProjectile),
  QFUNC(fireArtillery_dropUBomb)
] select _ammoCat);

_fireFunctionParams = [
  [_height],
  [_height],
  [_direction, _distance, _height, _dropAngle],
  [_direction, _distance, _height],
  [_direction, _distance, _height],
  [_height]
] select _ammoCat;

// Get condition data
private _timer = _logic getVariable [QGVAR(conditionTime), 10];
private _shellsCount = _logic getVariable [QGVAR(conditionShellsCount), 1];
private _salvosCount = _logic getVariable [QGVAR(conditionSalvosCount), 1];

// Condition counters
private _firedShots = 0;
private _firedSalvos = 0;
private _startTime = CBA_missionTime;

// Generate condition
private _conditionType = _logic getVariable [QGVAR(conditionType), 0];
private _condition = compile (switch _conditionType do {
  case 0: {
    [
      "_firedShots < _shellsCount",
      "_firedSalvos < _salvosCount"
    ] select _salvos
  };
  case 1: {
    "(CBA_missionTime - _startTime) < _timer"
  };
  case 2: {
    private _flags = parseSimpleArray (_logic getVariable [QGVAR(conditionLogicFlags), "[]"]);
    private _flagsCondition = _flags call FUNC(getLogicFlagsCondition);
    _flagsCondition params ["_flagsCond", "_usedFlags"];
    if (_flagsCond isEqualTo "" || {_usedFlags isEqualTo []}) then {
      TRACE_4("fireArtillery, flag condition empty",_logic,_flags,_flagsCond,_usedFlags);
      "false"
    } else {
      "missionNameSpace call {" + _flagsCond + "}"
    };
  };
  case 3: {
    _logic getVariable [QGVAR(conditionScript), "true"]
  };
  default {"false"};
});

TRACE_3("fireArtillery_moduleExecSpawn - starting fire",_logic,_ammoType,_condition);

while _condition do {
  for "_i" from 1 to _salvosShellCount do {
    if (_targetPosMode isEqualTo 0) then {
      // Update target pos if in area mode
      _targetPos = _logicArea call EFUNC(common,getAreaRandomPos);
      _targetPos set [2, 0];
    };
    // Fire shell
    [_ammoType, _targetPos, _showDebug, _fireFunctionParams] call _fireFunction;

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

TRACE_3("fireArtillery_moduleExecSpawn - end",_logic,_ammoType,_condition);

// Delete module
deleteVehicle _logic;
