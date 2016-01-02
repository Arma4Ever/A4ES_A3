#include "script_component.hpp"

params ["_unit", "_groupLeader"];
private ["_leaderPos"];

if(!isServer) exitWith {};

if(isMultiplayer) then {
    //multiplayer
    _unit enableSimulationGlobal true;
    _unit hideObjectGlobal false;
} else {
    //singleplayer
    _unit enableSimulation true;
    _unit hideObject false;
};

_leaderPos = getPos _groupLeader;
_unit setPos _leaderPos;
_unit setDamage 0;
