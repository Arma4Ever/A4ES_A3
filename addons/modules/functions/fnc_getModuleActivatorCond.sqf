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

private _units = ["switchableUnits", "playableUnits"] select isMultiplayer;
private _filterHelicopters = _logic getVariable [QGVAR(activationIgnoreHelicopters), false];
private _filterPlanes = _logic getVariable [QGVAR(activationIgnorePlanes), false];

// Create filter for vehicles
private _filter = "";
if (_filterHelicopters || _filterPlanes) then {
  private _bothFilters = (_filterHelicopters && _filterPlanes);
  _filter = format [
    "
      _units = _units select {
        private _parent = objectParent _x;
        (isNull _parent) || {%1%2%3%4}
      };
    ",
    ["", "(!(_parent isKindOf 'Helicopter'))"] select _filterHelicopters,
    ["", " && {"] select _bothFilters,
    ["", "(!(_parent isKindOf 'Plane'))"] select _filterPlanes,
    ["", "}"] select _bothFilters
  ];
};

// Return condition
format ["
  private _units = %1 inAreaArray %2;
  %3
  _units isNotEqualTo []
", _units, _activationArea, _filter]
