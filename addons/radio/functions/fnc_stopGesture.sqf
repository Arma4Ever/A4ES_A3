#include "script_component.hpp"
/*
 * Author: ACRE2Team
 * Handles stopping the radio gesture.
 */

params ["_unit"];
TRACE_1("stopGesture",_unit);

if !(_unit getVariable [QGVAR(onRadio), false]) exitWith {};

TRACE_1("stopGesture - exec",_unit);
_unit playActionNow QGVAR(stop);
_unit setVariable [QGVAR(onRadio), false];
