#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if(!isServer) exitWith {};
if(!_activated) exitWith {};

[[_logic, _units, _activated], QFUNC(snowEffectLocal), true, true] call BIS_fnc_MP;

true
