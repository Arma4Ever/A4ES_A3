#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles suppressed EH
 */

params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

// Exit if EH is triggered for remote unit - should not happen
if !(local _unit) exitWith {};
