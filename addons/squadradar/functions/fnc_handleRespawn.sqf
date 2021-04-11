#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

[{
  params ["_unit"];

  if (_unit isNotEqualTo ace_player) exitWith {};

  LOG("Handling respawn event");

  true call FUNC(updateUI);
}, _this] call CBA_fnc_execNextFrame;
