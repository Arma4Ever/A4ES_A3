#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for setLogicFlagValue module
 */

params ["_module", "_values"];

private _warnings = [];

/* private _task = _values getVariable [QGVAR(task), ""];
if (_task isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(setTaskState_Warning_MissingTask_Desc),
    QGVAR(task)
  ];
}; */

_warnings
