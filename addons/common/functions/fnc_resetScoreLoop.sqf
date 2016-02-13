/*
 * Author: SzwedzikPL
 * Reset players score
 */
#include "script_component.hpp"

{
    private _unit = _x;
    private _score = score _unit;
    if(_score != 0) then {
        _unit addScore (_score * -1);
    };
} foreach allPlayers;
