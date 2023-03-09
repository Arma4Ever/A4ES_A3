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
if !(_medic getVariable ["a4es_common_isPlayer", false]) exitWith {};

if (_medic isEqualTo _patient) then {
  ["a4es_playerFAKSelf", [_medic]] call CBA_fnc_serverEvent;
} else {
  ["a4es_playerFAK", [_medic, _patient]] call CBA_fnc_serverEvent;
};