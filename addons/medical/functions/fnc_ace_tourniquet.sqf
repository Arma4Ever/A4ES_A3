#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Applies a tourniquet to the patient on the given body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment (not used) <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftLeg", "", objNull, "ACE_tourniquet"] call ace_medical_treatment_fnc_tourniquet
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];

// Exit if there is a tourniquet already applied to body part
if ([_patient, _bodyPart] call FUNC(hasTourniquetAppliedTo)) exitWith {
    ["There is already a tourniquet on this body part!", 1.5] call EFUNC(common,displayTextStructured); // todo: localize
};

[_patient, _usedItem] call FUNC(addToTriageCard);
[_patient, "activity", LSTRING(Activity_appliedTourniquet), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(tourniquetLocal), [_patient, _bodyPart], _patient] call CBA_fnc_targetEvent;

// Send server log if medic is player
if !(_medic getVariable ["a3cs_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a3csserver_events_userSetTourSelf", [_medic, _bodyPart]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable ["a3cs_common_isPlayer", false]) then {
    ["a3csserver_events_userSetTour", [_medic, _patient, _bodyPart]] call CBA_fnc_serverEvent;
  } else {
    ["a3csserver_events_userSetTourAI", [_medic, _bodyPart]] call CBA_fnc_serverEvent;
  };
};
