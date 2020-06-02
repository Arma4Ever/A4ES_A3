#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for dynamicModule
 */

params ["_module", "_values"];

private _useParam = _values getVariable ["useParam", 0];

if (_useParam isEqualTo 0) exitWith {
  [["useParam 0 warning", "Module has no use in current configuration"]]
};

if (_useParam isEqualTo 1) exitWith {
  ["useParam 1 warning"]
};

if (_useParam isEqualTo 2) exitWith {
  ["useParam 2 warning"]
};

[]
