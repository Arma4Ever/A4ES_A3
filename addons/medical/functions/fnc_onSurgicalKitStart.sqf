#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: Brett Mayson
 * Handles the surgical kit treatment start by consuming a suture when applicable
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_surgicalKitStart
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];
TRACE_2("surgicalKitStart",_medic,_patient);

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;

if (_bandagedWoundsOnPart isEqualTo []) exitWith {false};

private _time = [_medic, _patient, _bodyPart] call FUNC(getStitchTime);

GVAR(singleWoundStitchTime) = (_time / (count _bandagedWoundsOnPart));

if (GVAR(consumeSurgicalKit) == 2) then {
    ([_medic, _patient, ["ACE_suture"]] call FUNC(useItem));
};
