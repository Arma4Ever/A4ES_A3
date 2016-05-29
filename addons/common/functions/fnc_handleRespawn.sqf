/*
 * Author: SzwedzikPL
 * Man respawn EH handler
 */
#include "script_component.hpp"

params ["_unit"];

if(_unit in playableUnits) then {
    [{
        params ["_unit"];
        //Disable score - works only on server ?
        _unit addEventHandler ["HandleScore", {false}];
    }, [_unit], 1] call CBA_fnc_waitAndExecute;
};
