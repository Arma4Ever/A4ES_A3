/*
    Author: SzwedzikPL

    Description:
    Create snow effect
*/
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];
private ["_effectType"];

if(!hasInterface) exitWith {};
if(!_activated) exitWith {};

_effectType = _logic getvariable ["effecttype", 0];

//flurry
if(_effectType == 0) then {
    [{
        private ["_sourceParent"];
        _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "", vehicle ace_player];
        _sourceParent setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setDropInterval 0.00001;
    }, [], 1] call ace_common_fnc_waitAndExecute;
};
//light storm
if(_effectType == 1) then {
    [{
        private ["_sourceParent", "_sourceLightFront", "_sourceLightRear", "_sourceLightRight", "_sourceLightLeft"];
        _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,10,0],"","Billboard",1,8,[0,0,8],[0,0,-8],(.7),1.69,1,2,[.05],[[1,1,1,0],[1,1,1,.99]],[1000],.7,.3,"","",vehicle ace_player];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setParticleRandom [0,[15,15,.5],[0,0,0],0,0.55,[0,0,0,.5],0,0];
        _sourceParent setDropInterval 0.003;
        _sourceLightFront = "#particlesource" createVehicleLocal (position player);
        _sourceLightFront setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,30,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","",vehicle ace_player];
        _sourceLightFront setParticleCircle [0,[0,0,0]];
        _sourceLightFront setParticleRandom [0,[20,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightFront setDropInterval 0.004;
        _sourceLightRear = "#particleSource" createVehicleLocal (position player);
        _sourceLightRear setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,14,[0,0,18],[0,0,-8],(.7),1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","",vehicle ace_player];
        _sourceLightRear setParticleCircle [0,[0,0,0]];
        _sourceLightRear setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightRear setDropInterval 0.009;
        _sourceLightRight = "#particlesource" createVehicleLocal (position player);
        _sourceLightRight setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,10,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","",vehicle ace_player];
        _sourceLightRight setParticleCircle [0,[0,0,0]];
        _sourceLightRight setParticleRandom [0,[15,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightRight setDropInterval 0.009;
        _sourceLightLeft = "#particleSource" createVehicleLocal (position player);
        _sourceLightLeft setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,8,[0,0,8],[0,0,-8],0,1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","",vehicle ace_player];
        _sourceLightLeft setParticleCircle [0,[0,0,0]];
        _sourceLightLeft setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightLeft setDropInterval 0.009;
    }, [], 1] call ace_common_fnc_waitAndExecute;
};

//med storm
if(_effectType == 2) then {
    [{
        private ["_sourceParent", "_sourceLightFront", "_sourceLightRear", "_sourceLightRight", "_sourceLightLeft"];
        _sourceParent = "#particleSource" createVehicleLocal (position player);
        _sourceParent setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,10,0],"","Billboard",1,8,[0,0,8],[0,0,-8],(.7),1.69,1,2,[.05],[[1,1,1,0],[1,1,1,.99]],[1000],.7,.3,"","",vehicle ace_player];
        _sourceParent setParticleCircle [0,[0,0,0]];
        _sourceParent setParticleRandom [0,[15,15,.5],[0,0,0],0,0.55,[0,0,0,.5],0,0];
        _sourceParent setDropInterval 0.001;
        _sourceLightFront = "#particlesource" createVehicleLocal (position player);
        _sourceLightFront setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,30,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","",vehicle ace_player];
        _sourceLightFront setParticleCircle [0,[0,0,0]];
        _sourceLightFront setParticleRandom [0,[20,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightFront setDropInterval 0.002;
        _sourceLightRear = "#particleSource" createVehicleLocal (position player);
        _sourceLightRear setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,14,[0,0,18],[0,0,-8],(.7),1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","",vehicle ace_player];
        _sourceLightRear setParticleCircle [0,[0,0,0]];
        _sourceLightRear setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightRear setDropInterval 0.007;
        _sourceLightRight = "#particlesource" createVehicleLocal (position player);
        _sourceLightRight setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,14,2,0],"","Billboard",1,10,[0,10,12],[0,0,-8],1,1.59,1,2,[1.75],[[1,1,1,0.2],[1,1,1,0.4]],[1000],0.5,0.15,"","",vehicle ace_player];
        _sourceLightRight setParticleCircle [0,[0,0,0]];
        _sourceLightRight setParticleRandom [0,[15,20,.5],[0,0,0],0,0,[0,0,0,0.03],0,0];
        _sourceLightRight setDropInterval 0.007;
        _sourceLightLeft = "#particleSource" createVehicleLocal (position player);
        _sourceLightLeft setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,8,[0,0,8],[0,0,-8],0,1.69,1,2,[5],[[1,1,1,0],[1,1,1,.29]],[1000],.7,.2,"","",vehicle ace_player];
        _sourceLightLeft setParticleCircle [0,[0,0,0]];
        _sourceLightLeft setParticleRandom [0,[40,40,.5],[0,0,0],0,0,[0,0,0,0],0,0];
        _sourceLightLeft setDropInterval 0.007;
    }, [], 1] call ace_common_fnc_waitAndExecute;
};
