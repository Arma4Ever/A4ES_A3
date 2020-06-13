#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets skill level of given unit or group
 */

params ["_target"];

// Exit if target is not a unit or group
if !(_target isEqualTypeAny [objNull, grpNull]) exitWith {};

//TODO!
