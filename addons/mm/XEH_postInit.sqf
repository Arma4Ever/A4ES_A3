#include "script_component.hpp"

if(!isServer) exitWith {};

["medical_onUnconscious", {
    params ["_unit", "_status"];
    if (_unit getVariable [QGVAR(genAttack), false] && {_status}) then {_unit setDamage 1;};
}] call EFUNC ace_common_fnc_addEventHandler;

[FUNC(initHeadless), [], 1] call ace_common_fnc_waitAndExecute;
[FUNC(initCache), [], 2] call ace_common_fnc_waitAndExecute;
