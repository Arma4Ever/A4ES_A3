/*
 * Author: SzwedzikPL
 * Init strobe thermal effect
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_strobe"];

private _particle = "#particlesource" createVehicleLocal [0,0,0];
_particle attachTo [_strobe, [0, 1.35, 0]];
_particle setParticleClass QGVAR(thermalEffect);
_particle setDropInterval 0;

GVAR(particleSources) pushback _particle;

if((currentVisionMode ace_player) == 2) then {
    [{_this setDropInterval 2;}, _particle, random 2] call CBA_fnc_waitAndExecute;
};
