#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns unit from unit data during game
 */

params [
  "_unitData",
  "_group",
  "_vehicles",
  "_goUpAfterSpawn",
  "_forceSpawnLying",
  "_forceDisablePATH",
  "_moduleDefenderBehaviour",
  "_lambsRadio",
  "_unitPostInit"
];
TRACE_2("units3DENComp_spawnData_unit",_unitData,_group);

_unitData params [
  "_className",
  "_vehicleData",
  "_posATL",
  "",
  "_vectors",
  "_unitLoadout",
  "_disableRandomization",
  "_skill",
  "_unitPos",
  "_doStop",
  "_disabledAI",
  "_lambsDangerDisableAI",
  "_lambsDangerDangerRadio",
  "_aceIsSurrendered",
  "_aceIsHandcuffed",
  ["_defenderBehaviour", 0]
];

// Create unit in correct group (side)
private _unit = _group createUnit [_className, ASLToAGL (ATLToASL _posATL), [], 0, "NONE"];
[_unit] joinSilent _group;

// Update skill
_unit setSkill _skill;

if (_disableRandomization) then {
  _unit call EFUNC(common,disableRandomization);
  _unit setUnitLoadout _unitLoadout;
};

if (_forceDisablePATH) then {
  _disabledAI pushBackUnique "PATH";
};

{_unit disableAI _x} forEach _disabledAI;

if (_lambsDangerDisableAI) then {
  _unit setVariable ["lambs_danger_disableAI", true, true];
};
if (_lambsDangerDangerRadio || _lambsRadio) then {
  _unit setVariable ["lambs_danger_dangerRadio", true, true];
};

private _isOnFoot = _vehicleData isEqualTo [];

if (_isOnFoot) then {
  _unit setPosATL _posATL;
  _unit setVectorDirAndUp _vectors;

  if (_forceSpawnLying) then {
    _unitPos = 2;
  };

  if (_unitPos in [0, 1, 2]) then {
    private _unitPosAnim = ["amovpercmstpsraswrfldnon", "amovpknlmstpsraswrfldnon", "amovppnemstpsraswrfldnon"] select _unitPos;
    [QEGVAR(common,switchMove), [_unit, _unitPosAnim]] call CBA_fnc_globalEvent;
    if (_goUpAfterSpawn) then {
      _unit setUnitPos "UP";
    } else {
      private _unitPosMode = ["UP" ,"MIDDLE", "DOWN"] select _unitPos;
      _unit setUnitPos _unitPosMode;
    };
  };
} else {
  _vehicleData params ["_vehicleIndex", "_role", "_cargoIndex", "_turretPath"];
  private _vehicle = _vehicles param [_vehicleIndex, objNull];
  if (isNull _vehicle) exitWith {
    TRACE_2("units3DENComp_spawnData_unit: unknown vehicle",_unit,_vehicleIndex);
  };
  if (_role isEqualTo "driver") exitWith {
    _unit assignAsDriver _vehicle;
    _unit moveInDriver _vehicle;
  };
  if (_role isEqualTo "commander") exitWith {
    _unit assignAsCommander _vehicle;
    _unit moveInCommander _vehicle;
  };
  if (_role isEqualTo "gunner") exitWith {
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
  };
  if (_role isEqualTo "turret") exitWith {
    _unit assignAsTurret [_vehicle, _turretPath];
    _unit moveInTurret [_vehicle, _turretPath];
  };
  if (_role isEqualTo "cargo") exitWith {
    _unit assignAsCargoIndex [_vehicle, _cargoIndex];
    _unit moveInCargo [_vehicle, _cargoIndex];
  };
};

if (_doStop) then {
  _unit spawn {
    sleep 0.001;
    doStop _this;
  };
};

if (_aceIsSurrendered) then {
  _unit spawn {
    sleep 0.001;
    [_this, true] call ACEFUNC(captives,setSurrendered);
  };
};

if (_aceIsHandcuffed) then {
  _unit spawn {
    sleep 0.001;
    [_this, true] call ACEFUNC(captives,setHandcuffed);
  };
};

if (_isOnFoot) then {
  if (_moduleDefenderBehaviour != -1) then {
    _defenderBehaviour = _moduleDefenderBehaviour;
  };

  if (_defenderBehaviour > 0) then {
    _unit setVariable [QEGVAR(ai,defenderBehaviour), _defenderBehaviour, true];
    _unit call EFUNC(ai,defenderBehaviour);
  };
};

// Call post init
_unit call _unitPostInit;
