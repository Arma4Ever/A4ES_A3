#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles CBA visionMode player event
 */

params ["", "_visionMode", "_prevVisionMode"];
TRACE_2("handleVisionModeChanged",_visionMode,_prevVisionMode);

if (_visionMode == 2) exitWith {
  0 call FUNC(cleanUpParticleSources);
  {
    _x call FUNC(enableEffect);
  } forEach GVAR(particleSources);
};

if (_prevVisionMode == 2) exitWith {
  0 call FUNC(cleanUpParticleSources);
  {_x setDropInterval 0;} forEach GVAR(particleSources);
};
