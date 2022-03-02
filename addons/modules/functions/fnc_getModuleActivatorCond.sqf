#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns optimized condition for module activator
 */

params ["_logic", "_activationMode", ["_activationArea", []]];
TRACE_3("getModuleActivatorCond",_logic,_activationMode,_activationArea);

// Return flags list
if (_activationMode isEqualTo 1) exitWith {
  parseSimpleArray (_logic getVariable [QGVAR(activationFlags), "[]"])
};

// Return user provided condition
if (_activationMode isEqualTo 2) exitWith {
  _logic getVariable [QGVAR(activationCondition), "true"]
};

// Get activation area
if (_activationArea isEqualTo []) then {
  // Create optimized players proximity condition
  private _activationRange = _logic getVariable [QGVAR(activationNearestPlayerDistance), 0];

  _activationArea = str [
    getPos _logic,
    _activationRange,
    _activationRange
  ];
} else {
  // Use provided area
  _activationArea = str _activationArea;
};

private _filterHelicopters = _logic getVariable [QGVAR(activationIgnoreHelicopters), false];
private _filterPlanes = _logic getVariable [QGVAR(activationIgnorePlanes), false];

private _unitsSource = QGVAR(moduleActivatorPlayers);

if (_filterHelicopters && _filterPlanes) then {
  _unitsSource = QGVAR(moduleActivatorPlayersNoAir);
} else {
  if (_filterHelicopters) then {
    _unitsSource = QGVAR(moduleActivatorPlayersNoHelis);
  };
  if (_filterPlanes) then {
    _unitsSource = QGVAR(moduleActivatorPlayersNoPlanes);
  };
};

// Return condition
format ["(%1 inAreaArray %2) isNotEqualTo []", _unitsSource, _activationArea]
