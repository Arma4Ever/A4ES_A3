#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns true if unit is in some squad
 */

params ["_unit"];

!(isNull (_unit call FUNC(getUnitSquad)))
