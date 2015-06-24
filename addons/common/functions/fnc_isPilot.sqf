/*
 * Author: SzwedzikPL
 *
 * Check if unit is pilot
 */
#include "script_component.hpp"

PARAMS_1(_unit);

_unit getVariable ["ACE_IsPilot", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "pilot") == 1]