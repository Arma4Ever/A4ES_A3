#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * Validator for suppliesStorage module
 */

params ["_module", "_values"];

[_module, QGVAR(storageID), "storage_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];
private _syncedObjects = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync")
};

if ((count _syncedObjects) < 2) then {
  _warnings pushBack [
    LLSTRING(suppliesStorage_Warning_SyncError),
    LLSTRING(suppliesStorage_Warning_SyncError_Desc)
  ];
};

{
  if (_x#0 isKindOf QGVAR(suppliesStorage)) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(suppliesStorage_Warning_WrongSync_Desc)
    ];
  };
} forEach _syncedObjects;

_warnings