#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Locks disconnected unit
 */

params ["_unit"];
TRACE_1("lockUnit",_unit);

if (
  !(local _unit) ||
  {!(alive _unit)}
) exitWith {};

_unit allowDamage false;
[_unit, true, _unit] call ace_captives_fnc_setHandcuffed;
