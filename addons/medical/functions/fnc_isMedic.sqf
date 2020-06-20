#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given unit an ACE medic (without location boosting)
 */

params [
  ["_unit", objNull, [objNull]],
  ["_minClass", 1, [0]],
  ["_useLocationBoost", false, [false]]
];

private _class = _unit getVariable [QACEGVAR(medical,medicClass), parseNumber (_unit getUnitTrait "medic")];

if (_class >= _minClass) exitWith {true};
if (_useLocationBoost && {!GVAR(systemDisabled)}) exitWith {
  [_unit, _minClass] call ACEFUNC(medical_treatment,isMedic)
};

false
