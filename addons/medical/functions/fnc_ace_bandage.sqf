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
 * 4: Item User <OBJECT>
 * 5: Used Item <STRING>
 * 6: Create litter <BOOLEAN>
 * 7: Bandage effectiveness coefficient <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandage
 *
 * Public: No
 */

_this set [7, _this param [7, 1]]; // set bandage effectiveness coefficient
[QGVAR(bandaged), _this] call CBA_fnc_localEvent; // Raise event with reference so mods can modify this

params ["_medic", "_patient", "_bodyPart", "_classname", "", "", "", "_bandageEffectiveness"];

[_patient, "activity", LSTRING(Activity_bandagedPatient), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(bandageLocal), [_patient, _bodyPart, _classname, _bandageEffectiveness], _patient] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a4es_common_isPlayer", false]) exitWith {};

if (_medic isEqualTo _patient) then {
  ["a4es_playerBandagedSelf", [_medic, _classname, _bodyPart]] call CBA_fnc_serverEvent;
} else {
  ["a4es_playerBandaged", [_medic, _patient, _classname, _bodyPart]] call CBA_fnc_serverEvent;
};
