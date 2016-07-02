/*
 * Author: SzwedzikPL
 * Action for checking unit damage (fix for vanilla wounds) - local
 */
#include "script_component.hpp"

params ["_caller", "_target"];

_target setDamage 0;
[_target, "body", 0, _target, objNull, 0] call ace_medical_fnc_handleDamage;
