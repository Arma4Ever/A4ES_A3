#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit squad or locationNull if no squad
 */

params ["_unit"];

_unit getVariable [QGVAR(squad), locationNull]
