/*
 * Author: SzwedzikPL
 * Set skill to selected level
 */
#include "script_component.hpp"

params ["_unit", "_training"];

if (!local _unit) exitWith {};

private _skillArray = [];

if (_training == "militia") then {
    _skillArray = [
        ["aimingAccuracy", 0.3],
        ["aimingSpeed", 0.3],
        ["aimingShake", 1],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 1],
        ["spotTime", 1]
    ];
};
if (_training == "guards") then {
    _skillArray = [
        ["aimingAccuracy", 0.4],
        ["aimingSpeed", 0.4],
        ["aimingShake", 1],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 1],
        ["spotTime", 1]
    ];
};
if (_training == "conscripts") then {
    _skillArray = [
        ["aimingAccuracy", 0.6],
        ["aimingSpeed", 0.6],
        ["aimingShake", 1],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 1],
        ["spotTime", 1]
    ];
};
if (_training == "professional") then {
    _skillArray = [
        ["aimingAccuracy", 0.8],
        ["aimingSpeed", 0.8],
        ["aimingShake", 1],
        ["commanding", 1],
        ["courage", 1],
        ["reloadSpeed", 1],
        ["spotDistance", 1],
        ["spotTime", 1]
    ];
};
if (_training == "elite") then {
    _skillArray = [
        ["aimingAccuracy", 1],
        ["aimingSpeed", 1],
        ["aimingShake", 1],
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
