#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds dialogue tree
 */

params ["_unit", "_dialogue"];

if !(alive _unit) exitWith {};

_unit setVariable [QGVAR(dialogue), _dialogue, true];
