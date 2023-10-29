#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * Validator for suppliesObject module
 */

params ["_module", "_values"];

private _warnings = [];

[_module, QGVAR(id), "supply_%1"] call FUNC(setUniqueIdAttribute);

private _syncedObjects = (get3DENConnections _module) select {
  ((_x #0) isEqualTo "Sync")
};

if ((count _syncedObjects) < 2) then {
  _warnings pushBack [
    LLSTRING(suppliesObject_Warning_SyncError),
    LLSTRING(suppliesObject_Warning_SyncError_Desc)
  ];
};

private _count = _values getVariable [QGVAR(objectCount), 0];
if (_count < 1) then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(suppliesObject_Warning_countEmpty_Desc),
    QGVAR(objectCount)
  ];
};

private _name = _values getVariable [QGVAR(name), ""];
if (_name isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(suppliesObject_Warning_NameEmpty_Desc),
    QGVAR(name)
  ];
};

{
  if (_x#0 isKindOf QGVAR(suppliesObject)) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(suppliesObject_Warning_WrongSync_Desc)
    ];
  };
} forEach _syncedObjects;

_warnings