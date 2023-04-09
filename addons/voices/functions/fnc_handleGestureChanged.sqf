#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Handles gestureChanged event
 */

params ["_unit", "_gesture"];

if (
	!(local _unit) ||
  {_unit getVariable [QGVAR(speakingDisabled), false]} ||
  {_unit getVariable [QGVAR(isSpeaking), false]} ||
  {_unit getVariable [QEGVAR(common,isPlayer), false]} ||
  {_gesture isEqualTo ""}
) exitWith {};

if (((weaponState _unit) # 6) > 0) then {
  [_unit, "reloading"] call FUNC(playSound);
};