/*
 * Author: SzwedzikPL
 * Action for checking unit damage (fix for vanilla wounds)
 */
#include "script_component.hpp"

params ["_caller","_target"];

if (local _target) then {
    ["actionCheckDamageLocal", [_caller, _target]] call ace_common_fnc_localEvent;
} else {
    ["actionCheckDamageLocal", _target, [_caller, _target]] call ace_common_fnc_targetEvent;
};
