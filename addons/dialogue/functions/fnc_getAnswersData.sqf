#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns answers data
 */

params ["_answers"];

_answers apply {GVAR(answersCache) get _x}
