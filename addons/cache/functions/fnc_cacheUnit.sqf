#include "script_component.hpp"

params ["_unit"];

if(!isServer) exitWith {};

if(isMultiplayer) then {
    //multiplayer
    _unit enableSimulationGlobal false;
    _unit hideObjectGlobal true;
} else {
    //singleplayer
    _unit enableSimulation false;
    _unit hideObject true;
};
