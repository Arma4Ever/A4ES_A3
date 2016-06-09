/*
 * Author: SzwedzikPL
 * Action for checking unit damage (fix for vanilla wounds)
 */
#include "script_component.hpp"

params ["_caller","_target"];

if (local _target) then {
    [QGVAR(actionCheckDamageLocal), [_caller, _target]] call CBA_fnc_localEvent;
} else {
    [QGVAR(actionCheckDamageLocal), _target, [_caller, _target]] call CBA_fnc_targetEvent;
};
