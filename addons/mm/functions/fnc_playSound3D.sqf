/*
 * Author: SzwedzikPL
 * play sound in playSound3D format
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params [
    ["_soundParams", [], [[]], 7],
    ["_isLoop", false, [false]],
    ["_loopCondition", {true}, [{}]],
    ["_soundDuration", 0, [0]]
];

if ((count _soundParams) != 7) exitWith {};

if (!isMultiplayer) then {
    systemChat format ["Odtwarzam dzwiek: %1", _soundParams select 0];
};

playSound3D _soundParams;

if (_isLoop) then {
    if (call _loopCondition) then {
        [DFUNC(playSound3D), _this, _soundDuration] call CBA_fnc_waitAndExecute;
    };
};
