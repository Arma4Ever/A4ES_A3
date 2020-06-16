#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles respawn event
 */

[{
  params ["_unit"];

  if !(_unit isEqualTo ace_player) exitWith {};

  // WIP
}, _this] call CBA_fnc_execNextFrame;
