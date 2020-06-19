#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if unit can join team
 */

params ["_unit", "_target"];

/* alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {!([_target] call EFUNC(common,isPlayer))}
&& {_target in units group _unit} */

true
