#include "script_component.hpp"

{
    private ["_unit", "_score"]
    _unit = _x;
    _score = score _unit;
    if(_score != 0) then {
        _score = _score * -1;
        _unit addScore _score;
    };
} foreach allPlayers;
