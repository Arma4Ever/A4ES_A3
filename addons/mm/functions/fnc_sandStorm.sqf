/*
 * Author: SzwedzikPL
 * Init client sandStorm effect
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (missionNamespace getVariable [QGVAR(sandStorm), false]) exitWith {true};
missionNamespace setVariable [QGVAR(sandStorm), true];

_n = 0 spawn {
    sleep 0.5;

    private _obj = player;
    private _pos = getPos (vehicle _obj);

    private _fog = "#particlesource" createVehicleLocal _pos;
    _fog setParticleParams [
       ["\A3\data_f\ParticleEffects\Universal\Universal" , 16, 12, 13, 0], "", "Billboard", 1, 10,
       [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
       [7,6], [[1, 1, 1, 0], [1, 0.85, 0.85, 0.1], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
    ];
    _fog setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
    _fog setParticleCircle [0.1, [0, 0, -0.12]];
    _fog setDropInterval 0.01;

    private _fog2 = "#particlesource" createVehicleLocal _pos;
    _fog2 setParticleParams [
       ["\A3\data_f\ParticleEffects\Universal\Universal" , 16, 12, 13, 0], "", "Billboard", 1, 10,
       [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
       [7,6], [[1, 1, 1, 0], [1, 0.85, 0.85, 0.1], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
    ];
    _fog2 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
    _fog2 setParticleCircle [0.1, [0, 0, -0.12]];
    _fog2 setDropInterval 0.01;

    while {true} do {
        _pos = position vehicle ace_player;
        _fog setpos _pos;
        _fog2 setpos _pos;
        sleep 1;
    };
};
