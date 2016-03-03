/*
 * Author: SzwedzikPL
 * Man init EH
 */
#include "script_component.hpp"

params ["_unit"];

_unit addEventHandler ["HitPart", {call FUNC(handleHitPart);}];

if(_unit in playableUnits) then {
    [{
        params ["_unit"];
        //Disable score - works only on server ?
        _unit addEventHandler ["HandleScore", {false}];
        //No rating - friendly fire ai fix
        _unit addEventHandler ["HandleRating", {0}];
    }, [_unit], 1] call ace_common_fnc_waitAndExecute;
};
