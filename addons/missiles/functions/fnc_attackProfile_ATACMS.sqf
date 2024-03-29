#include "script_component.hpp"
/*
 * Author: jaynus / nou / SzwedzikPL
 * Attack profile: ATACMS
 */

#define STAGE_LAUNCH 0
#define STAGE_CLIMB 1
#define STAGE_JDAM 2

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

private _shooterPos = getPosASL _shooter;
private _projectilePos = getPosASL _projectile;

private _distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;
private _distanceToShooter = _projectilePos vectorDistance _shooterPos;
private _distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

TRACE_2("",_distanceToTarget,_distanceToShooter);

// Add height depending on distance for compensate
private _returnTargetPos = _seekerTargetPos;

switch (_attackProfileStateParams # 3) do {
  case STAGE_LAUNCH: {
    TRACE_1("STAGE_LAUNCH","");
    if (_distanceToShooter < 10) then {
      _returnTargetPos = _seekerTargetPos vectorAdd [0, 0, _distanceToTarget * 2];
    } else {
      _attackProfileStateParams set [3, STAGE_CLIMB];
    };
  };
  case STAGE_CLIMB: {
    TRACE_1("STAGE_CLIMB","");
    private _cruisAlt = (_distanceShooterToTarget / 2) min 10000;
    if (_distanceShooterToTarget < 1250) then {
      _cruisAlt = 140 * ((0 max (_distanceShooterToTarget - 150))/1250);
      TRACE_1("_cruisAlt",_cruisAlt);
    };
    if (((ASLToAGL _projectilePos) select 2) - ((ASLToAGL _seekerTargetPos) select 2) >= _cruisAlt) then {
      _attackProfileStateParams set [3, STAGE_JDAM];
    } else {
       _returnTargetPos = _seekerTargetPos vectorAdd [0, 0, _distanceToTarget * 1.5];
    };
  };
  case STAGE_JDAM: {
    TRACE_1("STAGE_JDAM","");
    _returnTargetPos = _this call ace_missileguidance_fnc_attackProfile_jdam;
  };
};

TRACE_1("Adjusted target position",_returnTargetPos);
_returnTargetPos;
