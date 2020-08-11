#include "script_component.hpp"
/*
 * Author: diwako
 * Stops ACRE radio gesture
 */

params ["_unit"];

if !(_unit getVariable [QGVAR(gestureActive), false]) exitWith {};

_unit playActionNow "acre_radio_stop";
_unit setVariable [QGVAR(gestureActive), false];
