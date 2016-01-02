#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if(!isServer) exitWith {};

_enabled = _logic getvariable ["enabled", false];
_distance = _logic getvariable ["distance", 2000];

if(_enabled) then {
    GVAR(minDistance) = _distance;
    0 spawn FUNC(initCache);
};
