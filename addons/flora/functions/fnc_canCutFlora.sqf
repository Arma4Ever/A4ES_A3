#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if unit can cut flora
 */

params ["_unit"];

TRACE_1("canCutFlora",_unit);

"ACE_EntrenchingTool" in (_unit call ACEFUNC(common,uniqueItems))
