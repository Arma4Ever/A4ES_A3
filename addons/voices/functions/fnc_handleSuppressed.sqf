#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Handles suppressed event
 */

params ["_unit"];

if (
	!(local _unit) ||
  {_unit getVariable [QGVAR(speakingDisabled), false]} ||
  {_unit getVariable [QGVAR(isSpeaking), false]} ||
  {_unit getVariable [QEGVAR(common,isPlayer), false]}
) exitWith {};

[_unit, "suppressed"] call FUNC(playSound);