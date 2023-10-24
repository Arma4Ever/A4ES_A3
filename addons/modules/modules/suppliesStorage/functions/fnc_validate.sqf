#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * Validator for suppliesStorage module
 */

params ["_module", "_values"];

private _warnings = [];
private _syncedObject = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync")
};

if ((count _syncedObject) < 1) then {
  _warnings pushBack [
    LLSTRING(suppliesObject_Warning_SyncError),
    LLSTRING(suppliesObject_Warning_SyncError_Desc)
  ];
};

_warnings