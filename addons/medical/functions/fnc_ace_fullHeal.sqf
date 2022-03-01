#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Glowbal
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_fullHeal
 *
 * Public: No
 */

params ["_medic", "_patient"];

[_patient, "activity", LSTRING(Activity_fullHeal), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(fullHealLocal), _patient, _patient] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a3cs_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a3csserver_events_userFAKSelf", [_medic, _classname, _bodyPart]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable ["a3cs_common_isPlayer", false]) then {
    ["a3csserver_events_userFAK", [_medic, _patient, _classname, _bodyPart]] call CBA_fnc_serverEvent;
  } else {
    ["a3csserver_events_userFAKAI", [_medic, _classname, _bodyPart]] call CBA_fnc_serverEvent;
  };
};
