#include "script_component.hpp"

if(!isServer) exitWith {};
if(!isMultiplayer) exitWith {};

[{
    if(!isNil "a3c_headlessClient") then {
        if(!isNull a3c_headlessClient) then {
            [a3c_headlessClient] call FUNC(initHC);
        };
    };
}, [], 1] call ace_common_fnc_waitAndExecute;
