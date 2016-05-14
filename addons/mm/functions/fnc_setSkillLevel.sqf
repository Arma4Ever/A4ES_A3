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
        ["aimingShake", 1],
        ["aimingSpeed", 0.2],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.6],
        ["spotTime", 1]
    ];
};
if(_training == "guards") then {
    _skillArray = [
        ["aimingAccuracy", 0.4],
        ["aimingShake", 1],
        ["aimingSpeed", 0.4],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.6],
        ["spotTime", 1]
    ];
};
if(_training == "conscripts") then {
    _skillArray = [
        ["aimingAccuracy", 0.6],
        ["aimingShake", 1],
        ["aimingSpeed", 0.6],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.6],
        ["spotTime", 1]
    ];
};
if(_training == "professional") then {
    _skillArray = [
        ["aimingAccuracy", 0.8],
        ["aimingShake", 1],
        ["aimingSpeed", 0.8],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 0.8],
        ["spotTime", 1]
    ];
};
if(_training == "elite") then {
    _skillArray = [
        ["aimingAccuracy", 1],
        ["aimingShake", 1],
        ["aimingSpeed", 1],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 1],
        ["spotTime", 1]
    ];
};

{
    _x params ["_skill", "_level"];
    _unit setSkill [_skill, _level];
} forEach _skillArray;
