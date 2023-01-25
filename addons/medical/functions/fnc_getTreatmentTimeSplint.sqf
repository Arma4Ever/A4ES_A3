#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns treatment time for splint action
 */

params ["_medic"];

private _time = ace_medical_treatment_treatmentTimeSplint;

if ([_medic] call ACEFUNC(medical_treatment,isMedic)) then {
  _time = _time * 0.5;

  if (_medic call a4es_medical_fnc_isInDressingSetRange) then {
    _time = _time * 0.5;
  };
};

_time
