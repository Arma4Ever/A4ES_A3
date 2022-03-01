#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Return true if unit is in dressing set range
 */
params ["_unit"];

(nearestObjects [_unit, [QGVAR(dressingSet)], 6.5]) isNotEqualTo []
