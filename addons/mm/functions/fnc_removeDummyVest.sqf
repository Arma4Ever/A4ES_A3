/*
 * Author: SzwedzikPL
 * Remove dummy vest if present
 */
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};
if (vest _unit == "a3cs_dummyVest") then {removeVest _unit;};
