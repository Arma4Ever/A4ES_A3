/*
 * Author: SzwedzikPL
 * Vision mode change handler
 */
#include "script_component.hpp"

params ["_unit", "_visionMode"];

if(_visionMode == 2) then {
    //show all thermal effects
    {[{if((currentVisionMode ace_player) == 2) then {_this setDropInterval 2;};}, _x, random 2] call ace_common_fnc_waitAndExecute;} forEach GVAR(particleSources);
} else {
    //hide all thermal effects
    {_x setDropInterval 0;} forEach GVAR(particleSources);
};
