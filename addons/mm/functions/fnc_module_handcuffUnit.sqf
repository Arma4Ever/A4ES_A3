#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};
if (!isServer) exitWith {};

//Modules run before postInit can instal the event handler, so we need to wait a little bit
[{
    params ["_units"];
    {
        ["SetHandcuffed", [_x], [_x, true]] call ace_common_fnc_targetEvent;
    } forEach _units;
}, [_units], 0.05] call ace_common_fnc_waitAndExecute;

deleteVehicle _logic;
