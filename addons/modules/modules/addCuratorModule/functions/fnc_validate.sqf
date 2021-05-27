#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for addCuratorModule module
 */

params ["_module", "_values"];

private _warnings = [];

private _category = _values getVariable [QGVAR(category), ""];
if (_category isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(addCuratorModule_Warning_CategoryEmpty_Desc),
    QGVAR(category)
  ];
};

private _name = _values getVariable [QGVAR(name), ""];
if (_name isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(addCuratorModule_Warning_NameEmpty_Desc),
    QGVAR(name)
  ];
};

private _function = _values getVariable [QGVAR(function), ""];
if (_function isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(addCuratorModule_Warning_FunctionEmpty_Desc),
    QGVAR(function)
  ];
};

_warnings
