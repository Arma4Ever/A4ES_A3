#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for generatorComposition module
 */

params ["_module", "_values"];

private _warnings = [];
private _syncedUnits = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {(_x # 1) isKindOf "CAManBase"}
};

if !((count _syncedUnits) isEqualTo 1) then {
  _warnings pushBack [
    localize LSTRING(generatorComposition_Warning_SyncError),
    localize LSTRING(generatorComposition_Warning_SyncError_Desc)
  ];
};

_warnings
