/*
 * Author: SzwedzikPL, Borivoj Hlava
 * Generate fire on machine
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

//exit if no interface - it`s visual effect
if (!hasInterface) exitWith {};

//params
private _emitter = _logic getVariable ["emitter", objNull];
private _lightPoint = _logic getVariable ["lightPoint", objNull];
private _colorR = _logic getVariable ["colorR", 0.5];
private _colorG = _logic getVariable ["colorG", 0.5];
private _colorB = _logic getVariable ["colorB", 0.5];
private _damage = _logic getVariable ["damage", 1];
private _effectSize = _logic getVariable ["effectSize", 1];
private _particleDensity = _logic getVariable ["particleDensity", 25];
private _particleLifetime = _logic getVariable ["particleLifetime", 0.6];
private _particleSize = _logic getVariable ["particleSize", 1];
private _particleSpeed = _logic getVariable ["particleSpeed", 1];
private _particleDir = _logic getVariable ["particleDir", 1];

if (isNull _emitter || isNull _lightPoint) exitWith {};

//normalize color settings
_colorR = (_colorR min 1) max 0;
_colorG = (_colorG min 1) max 0;
_colorB = (_colorB min 1) max 0;

//particle settings
_emitter setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
    "",
    "billboard",
    1,
    _particleLifetime,
    [0, 0, 0],
    [0, 0, 0.4 * _particleSpeed],
    0,
    0.0565,
    0.05,
    0.03,
    [0.9 * _particleSize,0],
    [
        [1 * _colorR, 1 * _colorG, 1 * _colorB, -0],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, -1],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, -1],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, -1],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, -1],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, 0]
    ],
    [1],
    0.01,
    0.02,
    "",
    "",
    "",
    _particleDir,
    false,
    -1,
    [[3, 3, 3, 0]]
];

_emitter setParticleRandom [
    _particleLifeTime / 4,
    [0.15 * _effectSize, 0.15 * _effectSize, 0],
    [0.2, 0.2, 0],
    0.4,
    0,
    [0, 0, 0, 0],
    0,
    0,
    0.2
];
if (_damage > 0) then {_emitter setParticleFire [0.6 * _damage, 0.25 * _damage, 0.1];};
_emitter setDropInterval (1 / _particleDensity);

//light settings
_lightSize = (_particleSize + _effectSize) / 2;
_lightPoint setLightBrightness 1.0;
_lightPoint setLightColor [1, 0.65, 0.4];
_lightPoint setLightAmbient [0.15, 0.05, 0];
_lightPoint setLightIntensity (50 + 400 * _lightSize);
_lightPoint setLightAttenuation [0, 0, 0, 1];
_lightPoint setLightDayLight false;
