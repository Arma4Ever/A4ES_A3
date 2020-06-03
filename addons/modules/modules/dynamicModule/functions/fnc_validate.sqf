#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for dynamicModule
 */

params ["_module", "_values"];

private _useParam = _values getVariable ["useParam", 0];
private _warnings = [];

if (_useParam isEqualTo 0) then {
  _warnings pushBack [
    "Module has no use",
    "Module has no use in current configuration",
    "useParam"
  ];
  _warnings pushBack [
    "Module has no use 2",
    "Module has no use in current configuration 2",
    "useParam"
  ];
};

if (_useParam isEqualTo 1) then {
  _warnings pushBack [
    "Module has no use",
    "Module has no use in current configuration",
    "useParam"
  ];
};

_warnings
