#include "script_component.hpp"

if(!isServer) exitWith {};

["medical_onUnconscious", {
    params ["_unit", "_status"];
    if (_unit getVariable [QGVAR(genAttack), false] && {_status}) then {_unit setDamage 1;};
}] call EFUNC ace_common_fnc_addEventHandler;

[FUNC(initHeadless), [], 2] call ace_common_fnc_waitAndExecute;
[FUNC(initCache), [], 3] call ace_common_fnc_waitAndExecute;
