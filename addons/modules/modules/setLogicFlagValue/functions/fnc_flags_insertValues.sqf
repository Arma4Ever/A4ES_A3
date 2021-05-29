#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for setLogicFlagValue flag attribute
 */

params ["_module"];

private _modules = (all3DENEntities # 3) select {_x isKindOf QGVAR(createLogicFlag)};

// Get flags ids list
private _flags = _modules apply {
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
    ]
  } else {nil};
};

// Clear nils
_flags = _flags arrayIntersect _flags;

// Add info about empty tasks
if (_flags isEqualTo []) then {
  _flags = [[
    LLSTRING(setLogicFlagValue_Warning_emptyFlags),
    "",
    true,
    LLSTRING(setLogicFlagValue_Warning_emptyFlags_Tooltip),
    QPATHTOF(data\warning_red.paa)
  ]];
};

_flags
