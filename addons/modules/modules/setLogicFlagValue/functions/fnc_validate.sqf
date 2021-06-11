#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for setLogicFlagValue module
 */

params ["_module", "_values"];

private _warnings = [];

private _logicFlag = _values getVariable [QGVAR(logicFlag), ""];
if (_logicFlag isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(setLogicFlagValue_Warning_MissingFlag_Desc),
    QGVAR(logicFlag)
  ];
};

_warnings
