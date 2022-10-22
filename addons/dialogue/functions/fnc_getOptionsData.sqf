#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns options data
 */

params ["_options"];

_options apply {GVAR(optionsCache) get _x}
