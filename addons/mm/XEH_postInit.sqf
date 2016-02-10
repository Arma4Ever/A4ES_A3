#include "script_component.hpp"

if(!isServer) exitWith {};

[FUNC(initHeadless), [], 2] call ace_common_fnc_waitAndExecute;
[FUNC(initCache), [], 3] call ace_common_fnc_waitAndExecute;
