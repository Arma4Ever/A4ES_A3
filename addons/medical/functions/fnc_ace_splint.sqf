#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: PabstMirror
 * Applies a splint to the patient on the given body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_splint
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];
TRACE_3("splint",_medic,_patient,_bodyPart);

[QGVAR(splintLocal), [_medic, _patient, _bodyPart], _patient] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a3cs_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a3csserver_events_userSplintSelf", [_medic, _bodyPart]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable ["a3cs_common_isPlayer", false]) then {
    ["a3csserver_events_userSplint", [_medic, _patient, _bodyPart]] call CBA_fnc_serverEvent;
  } else {
    ["a3csserver_events_userSplintAI", [_medic, _bodyPart]] call CBA_fnc_serverEvent;
  };
};
