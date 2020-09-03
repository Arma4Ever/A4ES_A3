#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for curator module
 */

params ["_module", "_values"];

private _warnings = [];
private _syncedUnits = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {(_x # 1) isKindOf "CAManBase"}
};

if (_syncedUnits isEqualTo []) then {
  _warnings pushBack [
    localize LSTRING(curator_Warning_NoSyncedUnits),
    localize LSTRING(curator_Warning_NoSyncedUnits_Desc)
  ];
};

_warnings
