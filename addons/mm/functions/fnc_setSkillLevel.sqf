/*
 * Author: SzwedzikPL
 * Set skill to selected level
 */
#include "script_component.hpp"

if(!local _unit) exitWith {};

params ["_unit", "_training"];

private _skillArray = [];

if(_training == "militia") then {
    _skillArray = [
        ["aimingAccuracy", 0.2],
        ["aimingShake", 0.2],
        ["aimingSpeed", 0.5],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.5],
        ["spotTime", 0.8]
    ];
};
if(_training == "guards") then {
    _skillArray = [
        ["aimingAccuracy", 0.3],
        ["aimingShake", 0.3],
        ["aimingSpeed", 0.5],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.5],
        ["spotTime", 0.8]
    ];
};
if(_training == "conscripts") then {
    _skillArray = [
        ["aimingAccuracy", 0.4],
        ["aimingShake", 0.4],
        ["aimingSpeed", 0.5],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.6],
        ["spotTime", 0.8]
    ];
};
if(_training == "professional") then {
    _skillArray = [
        ["aimingAccuracy", 0.5],
        ["aimingShake", 0.5],
        ["aimingSpeed", 0.6],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.7],
        ["spotTime", 0.9]
    ];
};
if(_training == "elite") then {
    _skillArray = [
        ["aimingAccuracy", 0.6],
        ["aimingShake", 0.6],
        ["aimingSpeed", 0.7],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.8],
        ["spotTime", 0.9]
    ];
};

{
    _x params ["_skill", "_level"];
    _unit setSkill [_skill, _level];
} forEach _skillArray;
