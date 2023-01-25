#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the PAK treatment time based on the amount of damage to heal.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_getHealTime
 *
 * Public: No
 */

#define DAMAGE_SCALING_FACTOR 5

params ["_medic", "_patient"];

private _bodyPartDamage = 0;

{
    _bodyPartDamage = _bodyPartDamage + _x;
} forEach (_patient getVariable [QEGVAR(medical,bodyPartDamage), []]);

private _time = 10 max (((_bodyPartDamage * DAMAGE_SCALING_FACTOR) min 180) * GVAR(timeCoefficientPAK));

if ([_medic] call FUNC(isMedic)) then {
  _time = _time * 0.25;

  if (_medic call a4es_medical_fnc_isInDressingSetRange) then {
    _time = _time * 0.5;
  };
};

_time
