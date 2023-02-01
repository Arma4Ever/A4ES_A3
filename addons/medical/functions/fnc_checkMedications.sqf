#include "\z\ace\addons\medical_treatment\script_component.hpp"

params ["_medic", "_patient"];

private _patientName = [_patient] call ace_common_fnc_getName;
private _medications = _patient getVariable [VAR_MEDICATIONS,[]];
private _messageTitle = format [localize "STR_A4ES_Medical_CheckMedications_Result_Title", _patientName];

if (_medications isEqualTo []) exitWith {
  // No medications, show none
  [
    parseText format [
      "<t size='1.2'>%1</t>", localize "STR_A4ES_Medical_CheckMedications_None"
    ],
    _messageTitle,
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
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
  // Text empty, show none
  [
    parseText format [
      "<t size='1.2'>%1</t>", localize "STR_A4ES_Medical_CheckMedications_None"
    ],
    _messageTitle,
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
};

// Add results head
_text = (format [
  "%1<br /><br />",
  localize "STR_A4ES_Medical_CheckMedications_Result"
]) + _text;

// Show results
[
  parseText _text,
  _messageTitle,
  true,
  false,
  [] call BIS_fnc_displayMission,
  false,
  false
] spawn BIS_fnc_guiMessage;

