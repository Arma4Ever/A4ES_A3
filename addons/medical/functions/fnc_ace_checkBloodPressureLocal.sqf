#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for checking the blood pressure of a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftArm"] call ace_medical_treatment_fnc_checkBloodPressureLocal
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _bloodPressure = [0, 0];

if (alive _patient && {!([_patient, _bodyPart] call FUNC(hasTourniquetAppliedTo))}) then {
    _bloodPressure = GET_BLOOD_PRESSURE(_patient);
};

private _bloodPressureOutput = LSTRING(Check_Bloodpressure_Output_6);
private _logOutput = LSTRING(Check_Bloodpressure_NoBloodpressure);

_bloodPressure params ["_bloodPressureLow", "_bloodPressureHigh"];

if (_bloodPressureHigh > 20) then {
    if (_medic call FUNC(isMedic)) then {
        _bloodPressureOutput = LSTRING(Check_Bloodpressure_Output_1);
        _logOutput = format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow];
    } else {
        if (_bloodPressureHigh > 20) then {
            _bloodPressureOutput = LSTRING(Check_Bloodpressure_Output_2);
            _logOutput = LSTRING(Check_Bloodpressure_Low);

            if (_bloodPressureHigh > 100) then {
                _bloodPressureOutput = LSTRING(Check_Bloodpressure_Output_3);
                _logOutput = LSTRING(Check_Bloodpressure_Normal);

                if (_bloodPressureHigh > 160) then {
                    _bloodPressureOutput = LSTRING(Check_Bloodpressure_Output_4);
                    _logOutput = LSTRING(Check_Bloodpressure_High);
                };
            };
        };
    };
};

[_patient, "quick_view", LSTRING(Check_Bloodpressure_Log), [_medic call EFUNC(common,getName), _logOutput]] call FUNC(addToLog);

[QEGVAR(common,displayTextStructured), [[_bloodPressureOutput, _patient call EFUNC(common,getName), round _bloodPressureHigh, round _bloodPressureLow], 1.75, _medic], _medic] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a4es_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a4esserver_events_userCheckBPSelf", [_medic, _bodyPart, format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow]]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable ["a4es_common_isPlayer", false]) then {
    ["a4esserver_events_userCheckBP", [_medic, _patient, _bodyPart, format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow]]] call CBA_fnc_serverEvent;
  } else {
    ["a4esserver_events_userCheckBPAI", [_medic, _bodyPart, format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow]]] call CBA_fnc_serverEvent;
  };
};
