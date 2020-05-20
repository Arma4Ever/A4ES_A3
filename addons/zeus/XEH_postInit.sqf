#include "script_component.hpp"

if (!isServer) exitWith {};

[{
  ["ModuleCurator_F", "Init", {
    params ["_logic"];
    _logic call FUNC(initCurator);
  }, true, [], true] call CBA_fnc_addClassEventHandler;
}, [], 0.5] call CBA_fnc_waitAndExecute;
