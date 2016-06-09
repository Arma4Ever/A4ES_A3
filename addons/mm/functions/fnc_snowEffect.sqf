/*
 * Author: SzwedzikPL
 * Init client snow effect
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_effectType"];

if (missionNamespace getVariable [QGVAR(snowEffect), false]) exitWith {true};
missionNamespace setVariable [QGVAR(snowEffect), true];

//flurry
if (_effectType == 0) then {
    [{
        private _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "", player];
        _sourceParent setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setDropInterval 0.00001;
    }, [], 1] call CBA_fnc_waitAndExecute;
};
//light storm
if (_effectType == 1) then {
    [{
        private _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,10,0],"","Billboard",1,8,[0,0,8],[0,0,-8],(.7),1.69,1,2,[.05],[[1,1,1,0],[1,1,1,.99]],[1000],.7,.3,"","", player];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setParticleRandom [0,[15,15,.5],[0,0,0],0,0.55,[0,0,0,.5],0,0];
        _sourceParent setDropInterval 0.003;
        private _sourceLightFront = "#particlesource" createVehicleLocal (position player);
        _sourceLightFront setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,30,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","", player];
        _sourceLightFront setParticleCircle [0,[0,0,0]];
        _sourceLightFront setParticleRandom [0,[20,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightFront setDropInterval 0.004;
        private _sourceLightRear = "#particleSource" createVehicleLocal (position player);
        _sourceLightRear setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,14,[0,0,18],[0,0,-8],(.7),1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","", player];
        _sourceLightRear setParticleCircle [0,[0,0,0]];
        _sourceLightRear setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightRear setDropInterval 0.009;
        private _sourceLightRight = "#particlesource" createVehicleLocal (position player);
        _sourceLightRight setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,10,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","", player];
        _sourceLightRight setParticleCircle [0,[0,0,0]];
        _sourceLightRight setParticleRandom [0,[15,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightRight setDropInterval 0.009;
        private _sourceLightLeft = "#particleSource" createVehicleLocal (position player);
        _sourceLightLeft setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,8,[0,0,8],[0,0,-8],0,1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","", player];
        _sourceLightLeft setParticleCircle [0,[0,0,0]];
        _sourceLightLeft setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightLeft setDropInterval 0.009;
    }, [], 1] call CBA_fnc_waitAndExecute;
};

//med storm
if (_effectType == 2) then {
    [{
        private _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,10,0],"","Billboard",1,8,[0,0,8],[0,0,-8],(.7),1.69,1,2,[.05],[[1,1,1,0],[1,1,1,.99]],[1000],.7,.3,"","", player];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setParticleRandom [0,[15,15,.5],[0,0,0],0,0.55,[0,0,0,.5],0,0];
        _sourceParent setDropInterval 0.001;
        private _sourceLightFront = "#particlesource" createVehicleLocal (position player);
        _sourceLightFront setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,30,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","", player];
        _sourceLightFront setParticleCircle [0,[0,0,0]];
        _sourceLightFront setParticleRandom [0,[20,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightFront setDropInterval 0.002;
        private _sourceLightRear = "#particleSource" createVehicleLocal (position player);
        _sourceLightRear setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,14,[0,0,18],[0,0,-8],(.7),1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","", player];
        _sourceLightRear setParticleCircle [0,[0,0,0]];
        _sourceLightRear setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightRear setDropInterval 0.007;
        private _sourceLightRight = "#particlesource" createVehicleLocal (position player);
        _sourceLightRight setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,10,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","", player];
        _sourceLightRight setParticleCircle [0,[0,0,0]];
        _sourceLightRight setParticleRandom [0,[15,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightRight setDropInterval 0.007;
        private _sourceLightLeft = "#particleSource" createVehicleLocal (position player);
        _sourceLightLeft setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,8,[0,0,8],[0,0,-8],0,1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","", player];
        _sourceLightLeft setParticleCircle [0,[0,0,0]];
        _sourceLightLeft setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightLeft setDropInterval 0.007;
    }, [], 1] call CBA_fnc_waitAndExecute;
};
