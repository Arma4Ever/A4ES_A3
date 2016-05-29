/*
 * Author: SzwedzikPL
 * Reset players score
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

{
    private _unit = _x;
    private _score = score _unit;
    if(_score != 0) then {
        _unit addScore (_score * -1);
    };
} foreach allPlayers;

[DFUNC(resetScoreLoop), [], 30] call CBA_fnc_waitAndExecute;
