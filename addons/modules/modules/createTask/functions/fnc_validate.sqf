#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for curator module
 */

params ["_module", "_values"];

// Auto setup task id if not setuped yet
private _id = (_module get3DENAttribute QGVAR(id)) param [0, ""];
if (_id isEqualTo "") then {
  _id = format ["task_%1", get3DENEntityID _module];
  TRACE_2("Setuping task id",_module,_id);
  _module set3DENAttribute [QGVAR(id), _id];
};

private _warnings = [];

private _title = _values getVariable [QGVAR(title), ""];
if (_title isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(createTask_Warning_EmptyTitle_Desc),
    QGVAR(title)
  ];
};

_warnings
