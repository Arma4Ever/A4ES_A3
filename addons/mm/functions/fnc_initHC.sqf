#include "script_component.hpp"

if(!isServer) exitWith {};

params ["_hcUnit"];

[{
    params ["_hcUnit"];
    _hcOwner = owner _hcUnit;
    {_x setGroupOwner _hcOwner;} foreach allGroups;

    [{systemChat "Wszystkie AI zostaly przekazane do Headless Clienta poprawnie";}, "BIS_fnc_spawn", true] call BIS_fnc_MP;
}, [_hcUnit], 1] call ace_common_fnc_waitAndExecute;
