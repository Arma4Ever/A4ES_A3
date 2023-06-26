#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: mharis001
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_getStitchTime
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _stitchableTotal = 0;

{
    _stitchableTotal = _stitchableTotal + count _y;
} forEach (_patient call FUNC(getStitchableWounds));

private _time = _stitchableTotal * GVAR(woundStitchTime);

if ([_medic] call FUNC(isMedic)) then {
  _time = _time * 0.5;

  if (_medic call a4es_medical_fnc_isInDressingSetRange) then {
    _time = _time * 0.7;
  };
};

_time
