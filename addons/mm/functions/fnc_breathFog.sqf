/*
 * Author: SzwedzikPL
 * Init client breathFog effect
 */
#include "script_component.hpp"

if(!hasInterface) exitWith {};

if(missionNamespace getVariable [QGVAR(breathFog), false]) exitWith {true};
missionNamespace setVariable [QGVAR(breathFog), true];

["CAManBase", "init", {
    private _time = random 7.5;
    systemchat _time;
    [{
        params ["_unit"];
        private ["_intensity", "_source", "_fog"];
        _intensity = 0.03;
        _source = "logic" createVehicleLocal (position _unit);
        _fog = "#particlesource" createVehicleLocal (position _unit);
        _fog setParticleParams [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],
            "",
            "Billboard",
            0.5,
            0.5,
            [0,0,0],
            [0, 0.2, -0.2],
            1, 1.275, 1, 0.2,
            [0, 0.4,0],
            [[1,1,1, _intensity], [1,1,1, 0.01], [1,1,1, 0]],
            [1000],
            1,
            0.04,
            "",
            "",
            _source
        ];
        _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.4, [0, 0, 0, 0.1], 0, 0, 10];
        _fog setDropInterval 5;
        _source attachto [_unit, [0, 0.15, 0], "neck"];
    }, _this, _time] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventhandler;
