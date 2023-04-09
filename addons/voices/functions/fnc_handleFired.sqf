#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Handles fired event
 */

params ["_unit", "_weapon"];

if (
	!(local _unit) ||
  {_unit getVariable [QGVAR(speakingDisabled), false]} ||
  {_unit getVariable [QGVAR(isSpeaking), false]} ||
  {_unit getVariable [QEGVAR(common,isPlayer), false]}
) exitWith {};

if (_weapon == "Throw") then {
  [_unit, "throwing"] call FUNC(playSound);
} else {
  [_unit, "firing"] call FUNC(playSound);
};