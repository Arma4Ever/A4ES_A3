#include "script_component.hpp"

private ["_bisMouseOver", "_mouseOverObject"];

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

if (local _logic) then {
    [{
        params ["_units"];
        {
            ["SetSurrendered", [_x], [_x, true]] call ace_common_fnc_targetEvent;
        } forEach _units;
    }, [_units], 0.05]call ace_common_fnc_waitAndExecute;

    deleteVehicle _logic;
};
