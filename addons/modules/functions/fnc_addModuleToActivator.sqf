#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds module to activator system
 */

params ["_logic", "_condition", "_params", "_activatedFncName", "_activationDelay"];
TRACE_5("addModuleToActivator",_logic,_condition,_params,_activatedFncName,_activationDelay);

if !(isServer) exitWith {};

private _activation = if (_activationDelay > 0) then {
  compile format [
    "[{_this call %1}, _this, %2] call CBA_fnc_waitAndExecute;",
    _activatedFncName,
    _activationDelay
  ];
} else {
  compile format ["_this call %1", _activatedFncName];
};

if (_condition isEqualType []) exitWith {
  // Add module to flag activator in next frame
  // Makes sure flags are created so we can validate them and read initial values
  [
    {_this call FUNC(addModuleFlagActivator);},
    [_logic, _condition, _activation]
  ] call CBA_fnc_execNextFrame;
};

TRACE_2("Adding module to cyclic activator",_logic,_condition);
GVAR(activatorModuleCycleList) pushBack [
  _logic,
  compile _condition,
  _params,
  _activation
];

// Create PFH if not created yet
if (GVAR(moduleActivatorCyclePFH) isEqualTo -1) then {
  LOG("Starting module activator PFH");
  GVAR(moduleActivatorCycleIndex) = 0;
  GVAR(moduleActivatorCyclePFH) = [{
    0 call FUNC(moduleActivatorCycleTick);
  }, 0] call CBA_fnc_addPerFrameHandler;
};
