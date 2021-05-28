#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds module to activator system
 */

params ["_params", "_condition", "_params", "_activatedFncName", "_activationDelay"];
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

GVAR(activatorModuleList) pushBack [
  _logic,
  _condition,
  _params,
  _activation
];

// Create PFH if not created yet
if (GVAR(moduleActivatorPFH) isEqualTo -1) then {
  LOG("Starting module activator PFH");
  GVAR(moduleActivatorIndex) = 0;
  GVAR(moduleActivatorPFH) = [{
    0 call FUNC(moduleActivatorTick);
  }, 0] call CBA_fnc_addPerFrameHandler;
};
