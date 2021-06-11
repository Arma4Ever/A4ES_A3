#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for addAction module
 */

params ["_module", "_values"];

// Auto setup task id if not setuped yet
[_module, QGVAR(id), "action_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];

private _syncedObjects = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {!((_x # 1) isKindOf "EmptyDetector")}
};

if (_syncedObjects isEqualTo []) then {
  _warnings pushBack [
    LLSTRING(addAction_Warning_EmptySynced),
    LLSTRING(addAction_Warning_EmptySynced_desc)
  ];
};

_warnings
