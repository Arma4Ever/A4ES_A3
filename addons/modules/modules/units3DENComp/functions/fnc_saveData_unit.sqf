#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves unit data for units3DENComp module
 */

params ["_unit", "_vehiclesList", "_vehiclesCrewList"];
TRACE_1("units3DENComp_saveData_unit",_unit);

private _className = typeOf _unit;
private _disableRandomization = (_unit get3DENAttribute QEGVAR(editor,disableRandomization)) # 0;
private _unitLoadout = [];

// Save loadout only if randomization disabled
if (_disableRandomization) then {
  private _currentUnitLoadout = getUnitLoadout _unit;
  // Save loadout only if changed vs default
  if (_currentUnitLoadout isNotEqualTo (getUnitLoadout _className)) then {
    _unitLoadout = _currentUnitLoadout;
  };
};

private _vehicleData = [];
private _vehicle = objectParent _unit;
if !(isNull _vehicle) then {
  private _vehicleIndex = _vehiclesList find _vehicle;
  if (_vehicleIndex isEqualTo -1) exitWith {
    TRACE_2("units3DENComp_saveData_unit: unknown vehicle",_unit,_vehicle);
  };

  private _vehicleCrewData = _vehiclesCrewList select _vehicleIndex;
  private _unitCrewDataIndex = _vehicleCrewData findIf {(_x # 0) isEqualTo _unit};
  if (_unitCrewDataIndex isEqualTo -1) exitWith {
    TRACE_2("units3DENComp_saveData_unit: crew data not found vehicle",_unit,_vehicle);
  };

  private _unitCrewData = _vehicleCrewData select _unitCrewDataIndex;
  _unitCrewData params ["", "_role", "_cargoIndex", "_turretPath"];
  _vehicleData = [_vehicleIndex, _role, _cargoIndex, _turretPath];
};

private _disabledAI = AI_FEATURES select {
  (_unit get3DENAttribute (format [QEGVAR(editor,DisableAI_%1), _x])) # 0
};

// CAPTIVE

[
  _className,
  _vehicleData,
  getPosATL _unit,
  (_unit get3DENAttribute "rotation") # 0,
  [vectorDirVisual _unit, vectorUpVisual _unit],
  _unitLoadout,
  _disableRandomization,
  (_unit get3DENAttribute QEGVAR(ai,skill)) # 0,
  (_unit get3DENAttribute "unitPos") # 0,
  (_unit get3DENAttribute QEGVAR(editor,doStop)) # 0,
  _disabledAI,
  (_unit get3DENAttribute "lambs_danger_disableAI") # 0,
  (_unit get3DENAttribute "lambs_danger_dangerRadio") # 0,
  (_unit get3DENAttribute "ace_isSurrendered") # 0,
  (_unit get3DENAttribute "ace_isHandcuffed") # 0
]
