#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores unit for 3DEN from unit data
 */

params ["_logic", "_group", "_unitData", "_vehicles"];
TRACE_3("units3DENComp_restoreData_unit",_logic,_unitData,_vehicles);

_unitData params [
  "_className",
  "_vehicleData",
  "_posATL",
  "_rotation",
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
  "_aceIsHandcuffed"
];

private _unit = _group create3DENEntity ["object", _className, _posATL];

_unit set3DENAttribute ["position", _posATL];
_unit set3DENAttribute ["rotation", _rotation];
_unit set3DENAttribute [QEGVAR(editor,disableRandomization), _disableRandomization];
_unit set3DENAttribute [QEGVAR(ai,skill), _skill];
_unit set3DENAttribute ["unitPos", _unitPos];
_unit set3DENAttribute [QEGVAR(editor,doStop), _doStop];
_unit set3DENAttribute ["lambs_danger_disableAI", _lambsDangerDisableAI];
_unit set3DENAttribute ["lambs_danger_dangerRadio", _lambsDangerDangerRadio];
_unit set3DENAttribute ["ace_isSurrendered", _aceIsSurrendered];
_unit set3DENAttribute ["ace_isHandcuffed", _aceIsHandcuffed];

{
  _unit set3DENAttribute [(format [QEGVAR(editor,DisableAI_%1), _x]), true];
} forEach _disabledAI;

if (_vehicleData isNotEqualTo []) then {
  _vehicleData params ["_vehicleIndex", "_role", "_cargoIndex", "_turretPath"];
  private _vehicle = _vehicles param [_vehicleIndex, objNull];
  if (isNull _vehicle) exitWith {
    TRACE_2("units3DENComp_restoreData_unit: unknown vehicle",_unit,_vehicleIndex);
  };
  if (_role isEqualTo "driver") exitWith {_unit moveInDriver _vehicle};
  if (_role isEqualTo "commander") exitWith {_unit moveInCommander _vehicle};
  if (_role isEqualTo "gunner") exitWith {_unit moveInGunner _vehicle};
  if (_role isEqualTo "turret") exitWith {_unit moveInTurret [_vehicle, _turretPath]};
  if (_role isEqualTo "cargo") exitWith {_unit moveInCargo [_vehicle, _cargoIndex]};
};

if (_disableRandomization) then {
  _unit setUnitLoadout _unitLoadout;
  save3DENInventory [_unit];
};

add3DENConnection ["Sync", [_unit], _logic];
