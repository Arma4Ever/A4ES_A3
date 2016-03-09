#include "script_component.hpp"

if(!hasInterface && !isDedicated) then {
    missionNamespace setVariable [QGVAR(headlessClient), player, true];
    [{
        [] remoteExecCall [QFUNC(initHeadless), 2, false];
    }, [], 1] call ace_common_fnc_waitAndExecute;
};

["medical_onUnconscious", {
    params ["_unit", "_status"];
    if(!local _unit) exitWith {};
    if (_unit getVariable [QGVAR(genAttack), false] && {_status}) then {_unit setDamage 1;};
}] call EFUNC ace_common_fnc_addEventHandler;

if(!isServer) exitWith {};

[FUNC(initCache), [], 5] call ace_common_fnc_waitAndExecute;
