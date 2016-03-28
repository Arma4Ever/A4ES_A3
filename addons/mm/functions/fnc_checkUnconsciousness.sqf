/*
 * Author: SzwedzikPL
 * Check unconsciousness of unit after some time
 * NOT USED SINCE WE DISABLED UNCCONSCIOUSNESS FOR AI
 */
#include "script_component.hpp"

params ["_unit"];

_unconsciousTime = _unit getVariable [QGVAR(unconsciousTime), 0];
if ((_unit getVariable ["ACE_isUnconscious",false]) && {(ACE_time - _unconsciousTime) > 60}) then {
    _unit setDamage 1;
};
