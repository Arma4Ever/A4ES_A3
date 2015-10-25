#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!isServer) exitWith {};
if(!_activated) exitWith {};

[[_logic, _units, _activated],QFUNC(colorCorrectionsLocal),true,true] call BIS_fnc_MP;

true
