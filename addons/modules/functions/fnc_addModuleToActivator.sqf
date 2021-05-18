#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds module to activator system
 */

params ["_logic", "_activationMode", "_activatedFncName"];

if !(isServer) exitWith {};

LOG_3("Adding module to activator (logic: %1 activationMode: %2 activatedFncName: %3).",str _logic,str _activationMode,_activatedFncName);

private _condition = compile ([_logic, _activationMode] call FUNC(getModuleActivatorCond));
private _activation = if (_logic getVariable [QGVAR(activationDelay), false]) then {
  compile format [
    "[{_this call %1}, _this, %2] call CBA_fnc_waitAndExecute;",
    _activatedFncName,
    _logic getVariable [QGVAR(activationDelayTime), 0]
  ];
} else {
  compile format ["_this call %1", _activatedFncName];
};

GVAR(activatorModuleList) pushBack [
  _logic,
  _condition,
  _activation
];

// Create PFH if not created yet
if (GVAR(moduleActivatorPFH) isEqualTo -1) then {
  LOG("Starting module activator PFH");
  GVAR(moduleActivatorIndex) = 0;
  GVAR(moduleActivatorPFH) = [{
    0 call FUNC(moduleActivatorTick);
  }, 0, 0] call CBA_fnc_addPerFrameHandler;
};
