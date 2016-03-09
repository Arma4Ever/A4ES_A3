/*
 * Author: SzwedzikPL
 * Local EH handler
 */
#include "script_component.hpp"

params ["_unit"];

if(!local _unit) exitWith {};

_unit call FUNC(loadSpecialStates);
