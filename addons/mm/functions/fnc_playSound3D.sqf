/*
 * Author: SzwedzikPL
 * play sound in playSound3D format
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params [["_soundParams", [], [[]], 7], ["_isLoop", false, [false]], ["_soundDuration", 0, [0]]];

if((count _soundParams) != 7) exitWith {};

playSound3D _soundParams;

if(_isLoop) then {
    [DFUNC(playSound3D), _this, _soundDuration] call ace_common_fnc_waitAndExecute;
};
