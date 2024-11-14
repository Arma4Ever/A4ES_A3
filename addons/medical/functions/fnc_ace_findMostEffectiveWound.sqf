#include "\z\ace\addons\medical_treatment\script_component.hpp"
/*
 * Author: kymckay, modified by SzwedzikPL
 * Finds the wound most effective to bandage on the given bodypart of the patient for the given bandage type.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Treatment classname <STRING>
 * 2: Body part <STRING>
 *
 * Return Value:
 * [Wound, Index, Effectiveness] <ARRAY, NUMBER, NUMBER>
 *
 * Public: No
 */

params ["_patient", "_bandage", "_bodyPart", ["_bandageRemaining", 1], ["_foundWounds", createHashMap]];
TRACE_1("findMostEffectiveWounds",count _foundWounds);

// Get the default effectiveness for the used bandage
private _config = configFile >> QUOTE(ADDON) >> "Bandaging";
private _effectiveness = getNumber (_config >> "effectiveness");

if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);

    if (isNumber (_config >> "effectiveness")) then {
        _effectiveness = getNumber (_config >> "effectiveness");
    };
};

// Iterate over open wounds to find the most effective target
private _openWounds = GET_OPEN_WOUNDS(_patient) getOrDefault [_bodyPart, []];
if (_openWounds isEqualTo []) exitWith {_foundWounds};

private _wound = EMPTY_WOUND;
private _woundIndex = -1;
private _effectivenessFound = -1;
private _impactFound = -1;
private _isMedic = [ace_player] call FUNC(isMedic);

{
    // Ignore iterated wounds
    if (_x in _foundWounds) then {continue};
    _x params ["_classID", "_amountOf", "_bleeding", "_damage"];

    private _woundEffectiveness = _effectiveness;

    // Select the classname from the wound classname storage
    private _className = EGVAR(medical_damage,woundClassNamesComplex) select _classID;

    // Get the effectiveness of the bandage on this wound type
    if (isClass (_config >> _className)) then {
        private _woundTreatmentConfig = _config >> _className;

        if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
            _woundEffectiveness = getNumber (_woundTreatmentConfig >> "effectiveness");
        };
    } else {
        // Basic medical bandage just has a base level config (same effectiveness for all wound types)
        if (_bandage != "BasicBandage") then {
            WARNING_2("No config for wound type [%1] config base [%2]",_className,_config);
        };
    };

    // Multiply by bandageRemaining in case this is a rollover
    _woundEffectiveness = _woundEffectiveness * _bandageRemaining;

    // Track most effective found so far
    if ((_woundEffectiveness * _amountOf * _bleeding) > (_effectivenessFound * (_wound select 1) * (_wound select 2))) then {
        _effectivenessFound = _woundEffectiveness;

        if (_isMedic) then {
          _effectivenessFound = _effectivenessFound * 1.2;
        };
        
        _impactFound = _amountOf min _effectivenessFound;
        _woundIndex = _forEachIndex;
        _wound = _x;
    };
} forEach _openWounds;

if (_woundIndex isEqualTo -1) exitWith {_foundWounds};

_bandageRemaining = _bandageRemaining - (_impactFound/_effectivenessFound);
_foundWounds set [_wound, [_effectivenessFound, _woundIndex, _impactFound]];

// recursion, run function again to find next most effective wound
if (GVAR(bandageRollover) && {_bandageRemaining > 0}) then {
    [_patient, _bandage, _bodyPart, _bandageRemaining, _foundWounds] call FUNC(findMostEffectiveWounds);
};

_foundWounds // return