#include "script_component.hpp"

if (!hasInterface && !isDedicated) then {
    missionNamespace setVariable [QGVAR(headlessClient), player, true];
    [{[] remoteExecCall [QFUNC(initHeadless), 2, false];}, [], 1] call ace_common_fnc_waitAndExecute;
};

["medical_onUnconscious", {
    params ["_unit", "_status"];
    TRACE_2("medical_onUnconscious",_unit,_status);
    if (!local _unit || {!_status}) exitWith {};
    if (_unit getVariable [QGVAR(genAttack), false]) exitWith {_unit setDamage 1;};
    _unit setVariable [QGVAR(unconsciousTime), ACE_time];
    [DFUNC(checkUnconsciousness), [_unit], 61] call ace_common_fnc_waitAndExecute;
}] call EFUNC ace_common_fnc_addEventHandler;

if (!isServer) exitWith {};

[FUNC(initCache), [], 5] call ace_common_fnc_waitAndExecute;
