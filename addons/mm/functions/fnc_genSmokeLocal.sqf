/*
 * Author: SzwedzikPL, Borivoj Hlava
 * Generate smoke on machine
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

//exit if no interface - it`s visual effect
if (!hasInterface) exitWith {};

//params
private _emitter = _logic getVariable ["emitter", objNull];
private _colorR = _logic getVariable ["colorR", 0.5];
private _colorG = _logic getVariable ["colorG", 0.5];
private _colorB = _logic getVariable ["colorB", 0.5];
private _colorA = _logic getVariable ["colorA", 0.5];
private _effectSize = _logic getVariable ["effectSize", 1];
private _particleDensity = _logic getVariable ["particleDensity", 10];
private _particleLifeTime = _logic getVariable ["particleLifetime", 45];
private _particleSize = _logic getVariable ["particleSize", 1];
private _effectExpansion = _logic getVariable ["effectExpansion", 1];
private _particleSpeed = _logic getVariable ["particleSpeed", 1];
private _particleLifting = _logic getVariable ["particleLifting", 1];
private _windEffect = _logic getVariable ["windEffect", 1];

if (isNull _emitter) exitWith {};

//normalize color settings
_colorR = (_colorR min 1) max 0;
_colorG = (_colorG min 1) max 0;
_colorB = (_colorB min 1) max 0;
_colorA = (_colorA min 1) max 0;

//particle settings
_emitter setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 40, 1],
    "",
    "billboard",
    1,
    _particleLifeTime,
    [0, 0, 0],
    [0, 0, 2 * _particleSpeed],
    0,
    0.05,
    0.04 * _particleLifting,
    0.05 * _windEffect,
    [1 * _particleSize + 1, 1.8 * _particleSize + 15],
    [
        [0.7 * _colorR, 0.7 * _colorG, 0.7 * _colorB, 0.7 * _colorA],
        [0.7 * _colorR, 0.7 * _colorG, 0.7 * _colorB, 0.6 * _colorA],
        [0.7 * _colorR, 0.7 * _colorG, 0.7 * _colorB, 0.45 * _colorA],
        [0.84 * _colorR, 0.84 * _colorG, 0.84 * _colorB, 0.28 * _colorA],
        [0.84 * _colorR, 0.84 * _colorG, 0.84 * _colorB, 0.16 * _colorA],
        [0.84 * _colorR, 0.84 * _colorG, 0.84 * _colorB, 0.09 * _colorA],
        [0.84 * _colorR, 0.84 * _colorG, 0.84 * _colorB, 0.06 * _colorA],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, 0.02 * _colorA],
        [1 * _colorR, 1 * _colorG, 1 * _colorB, 0 * _colorA]
    ],
    [1, 0.55, 0.35],
    0.1,
    0.08 * _effectExpansion,
    "",
    "",
    ""
];

_emitter setParticleRandom [
    _particleLifeTime / 2,
    [0.5 * _effectSize, 0.5 * _effectSize, 0.2 * _effectSize],
    [0.3, 0.3, 0.5],
    1,
    0,
    [0, 0, 0, 0.06],
    0,
    0
];

_emitter setDropInterval (1 / _particleDensity);
