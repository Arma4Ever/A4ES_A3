/*
 * Author: SzwedzikPL
 * Loop refreshing curator points every 60 sec
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

{_x addCuratorPoints 1;} forEach allCurators;

[FUNC(curatorPointsLoop), [], 60] call CBA_fnc_waitAndExecute;
