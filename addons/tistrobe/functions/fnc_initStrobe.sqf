#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits TI strobe
 */

params ["_strobe"];
TRACE_1("initStrobe",_strobe);

if !(hasInterface) exitWith {};

private _particle = "#particlesource" createVehicleLocal [0,0,0];
_particle attachTo [_strobe, [0, 1.35, 0]];
_particle setParticleClass QGVAR(thermalEffect);
_particle setDropInterval 0;

GVAR(particleSources) pushback _particle;

if ((currentVisionMode ace_player) == 2) then {
  _particle call FUNC(enableEffect);
};
