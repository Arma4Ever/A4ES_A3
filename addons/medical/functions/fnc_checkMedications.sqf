#include "\z\ace\addons\medical_treatment\script_component.hpp"

params ["_medic", "_patient"];

private _medications = _patient getVariable [VAR_MEDICATIONS,[]];

if (_medications isEqualTo []) exitWith {
  hint format [
    "%1<br /><br />%2",
    [_patient] call ace_common_fnc_getName,
    localize "STR_A3CS_Medical_CheckMedications_None"
  ];
};

private _text = "";

{
    _x params ["_medication", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];
    private _timeInSystem = CBA_missionTime - _timeAdded;
    if (_timeInSystem < _maxTimeInSystem) then {
        private _effectRatio = (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
        _text = _text + (format ["%1: %2%<br />", _medication, _effectRatio]);
    };
} forEach _medications;

if (_text == "") exitWith {
  hint format [
    "%1<br /><br />%2",
    [_patient] call ace_common_fnc_getName,
    localize "STR_A3CS_Medical_CheckMedications_None"
  ];
};

_text = (format [
  "%1<br /><br />%2<br /><br />",
  [_patient] call ace_common_fnc_getName,
  localize "STR_A3CS_Medical_CheckMedications_Result"
]) + _text;

hint parseText _text;
