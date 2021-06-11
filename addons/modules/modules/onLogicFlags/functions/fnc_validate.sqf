#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for onLogicFlags module
 */

params ["_module", "_values"];

private _warnings = [];

if (_values getVariable [QGVAR(changeTaskState), false]) then {
  if ((_values getVariable [QGVAR(task), ""]) isEqualTo "") then {
    _warnings pushBack [
      LLSTRING(Warning_changeTaskState_MissingTask),
      LLSTRING(Warning_changeTaskState_MissingTask_Desc),
      QGVAR(task)
    ];
  };
};

_warnings
