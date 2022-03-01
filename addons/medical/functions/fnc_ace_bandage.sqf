#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Glowbal
 * Bandages open wounds on the given body part of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandage
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

[_patient, "activity", LSTRING(Activity_bandagedPatient), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(bandageLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a3cs_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a3csserver_events_userBandSelf", [_medic, _classname, _bodyPart]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable ["a3cs_common_isPlayer", false]) then {
    ["a3csserver_events_userBand", [_medic, _patient, _classname, _bodyPart]] call CBA_fnc_serverEvent;
  } else {
    ["a3csserver_events_userBandAI", [_medic, _classname, _bodyPart]] call CBA_fnc_serverEvent;
  };
};
