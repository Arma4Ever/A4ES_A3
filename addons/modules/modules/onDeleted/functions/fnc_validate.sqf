#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for onDeleted module
 */

params ["_module", "_values"];

private _warnings = [];
private _syncedObjects = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {
    !((_x # 1) isKindOf "EmptyDetector") &&
    {!((_x # 1) isKindOf "Logic")}
  }
};
if ( _syncedObjects isEqualTo []) then {
  _warnings pushBack [
    LLSTRING(onDeleted_Warning_EmptySynced),
    LLSTRING(onDeleted_Warning_EmptySynced_Desc)
  ];
};

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
