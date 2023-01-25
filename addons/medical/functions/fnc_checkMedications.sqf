#include "\z\ace\addons\medical_treatment\script_component.hpp"

params ["_medic", "_patient"];

private _medications = _patient getVariable [VAR_MEDICATIONS,[]];

if (_medications isEqualTo []) exitWith {
  hint parseText format [
    "<t size='2'>%1</t><br /><br />%2",
    [_patient] call ace_common_fnc_getName,
    localize "STR_A4ES_Medical_CheckMedications_None"
  ];
};

private _text = "";

{
    _x params ["_medication", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];
    private _timeInSystem = CBA_missionTime - _timeAdded;
    if (_timeInSystem < _maxTimeInSystem) then {
        private _effectRatio = (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
        _text = _text + (format ["<t size='1.5'>%1: %2%3</t><br />", _medication, (_effectRatio * 100) toFixed 0, '%']);
    };
} forEach _medications;

if (_text == "") exitWith {
  hint parseText format [
    "<t size='2'>%1</t><br /><br />%2",
    [_patient] call ace_common_fnc_getName,
    localize "STR_A4ES_Medical_CheckMedications_None"
  ];
};

_text = (format [
  "<t size='2'>%1</t><br /><br />%2<br /><br />",
  [_patient] call ace_common_fnc_getName,
  localize "STR_A4ES_Medical_CheckMedications_Result"
]) + _text;

hint parseText _text;
