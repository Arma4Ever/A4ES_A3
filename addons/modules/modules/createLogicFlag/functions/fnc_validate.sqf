#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for createLogicFlag module
 */

params ["_module", "_values"];

// Auto setup flag id if not setuped yet
[_module, QGVAR(id), "flag_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];

/* private _title = _values getVariable [QGVAR(title), ""];
if (_title isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(createTask_Warning_EmptyTitle_Desc),
    QGVAR(title)
  ];
}; */

_warnings
