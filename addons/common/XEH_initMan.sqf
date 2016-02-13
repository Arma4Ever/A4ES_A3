#include "script_component.hpp"

params ["_unit"];

if(_unit in playableUnits) then {
    [{
        params ["_unit"];
        //Disable score
        if(isServer) then {_unit addEventHandler ["HandleScore", {false}];};
        //No rating - friendly fire ai fix
        if(local _unit) then {_unit addEventHandler ["HandleRating", {0}];};
    }, [_unit], 1] call ace_common_fnc_waitAndExecute;
};
