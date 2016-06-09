/*
 * Author: SzwedzikPL
 * Man init EH handler
 */
#include "script_component.hpp"

params ["_unit"];

if (is3DEN) exitWith {};
if (!local _unit) exitWith {};

_unit call FUNC(loadUnitSettings);
