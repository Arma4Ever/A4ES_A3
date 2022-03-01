#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Enables particle effect
 */

params ["_particle"];
TRACE_1("enableEffect",_particle);

[{
  if ((currentVisionMode ace_player) == 2) then {
    _this setDropInterval 2;
  };
}, _particle, random 2] call CBA_fnc_waitAndExecute;
