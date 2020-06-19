#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns true if unit is in given squad
 */

params ["_unit", "_squad"];

if (isNull _unit || isNull _squad) exitWith {false};

(_unit call FUNC(getUnitSquad)) isEqualTo _squad
