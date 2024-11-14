#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns treatment time for splint action
 */

params ["_medic"];

private _time = ace_medical_treatment_treatmentTimeAutoinjector;

if !([_medic] call ACEFUNC(medical_treatment,isMedic)) then {
  _time = _time * 2;
};

_time
