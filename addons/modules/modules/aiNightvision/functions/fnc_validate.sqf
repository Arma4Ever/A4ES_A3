#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for aiNightvision module
 */

params ["_module", "_values"];

private _warnings = [];

private _className = _values getVariable [QGVAR(className), ""];
if (_className isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(aiNightvision_Warning_ClassNameEmpty_Desc),
    QGVAR(className)
  ];
};

_warnings
