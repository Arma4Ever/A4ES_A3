#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Unlock connected unit
 */

params ["_unit"];
TRACE_1("unlockUnit",_unit);

if (
  !(local _unit) ||
  {!(alive _unit)}
) exitWith {};

_unit allowDamage true;
[_unit, false, _unit] call ace_captives_fnc_setHandcuffed;
