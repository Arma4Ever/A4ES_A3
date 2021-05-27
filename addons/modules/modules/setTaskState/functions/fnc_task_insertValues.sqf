#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for setTaskState task attribute
 */

params ["_module"];

private _modules = (all3DENEntities # 3) select {_x isKindOf QGVAR(createTask)};
// Remove self
_modules deleteAt (_modules find _module);

// Get tasks ids list
private _tasks = _modules apply {
  private _id = (_x get3DENAttribute QGVAR(id)) param [0, ""];
  if (
    (_id isEqualType "") &&
    (_id isNotEqualTo "")
  ) then {
    [
      (_x get3DENAttribute QGVAR(title)) param [0, ""],
      _id,
      false,
      _id
      // TODO ICON
    ]
  } else {nil};
};

// Clear nils
_tasks = _tasks arrayIntersect _tasks;

// Add info about empty tasks
if (_tasks isEqualTo []) then {
  _tasks = [[
    LLSTRING(setTaskState_Warning_emptyTasks),
    "",
    true,
    LLSTRING(setTaskState_Warning_emptyTasks_Tooltip),
    QPATHTOF(data\warning_red.paa)
  ]];
};

_tasks
