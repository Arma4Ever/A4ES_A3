#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for onKilled module
 */

params ["_module", "_values"];

private _warnings = [];

private _syncedObjects = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {
    !((_x # 1) isKindOf "EmptyDetector") &&
    {!((_x # 1) isKindOf "Logic")}
  }
};
_objectsList = _values getVariable [QGVAR(objectsList), ""];
if ( _syncedObjects isEqualTo [] && {_objectsList isEqualTo ""}) then {
  _warnings pushBack [
    LLSTRING(onKilled_Warning_EmptySynced),
    LLSTRING(onKilled_Warning_EmptySynced_Desc)
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
