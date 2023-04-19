#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles GetOutMan event
 */

params ["_unit"];

if (!(local _unit) || {_unit getVariable [QEGVAR(common,isPlayer), false]}) exitWith {};

_unit playActionNow "ReloadMagazine";