#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for units3DENComp module
 */

params ["_module", "_values"];

private _warnings = [];

if ((_values getVariable [QGVAR(activationMode), 0]) isEqualTo 3) then {
  private _syncedTriggers = (get3DENConnections _module) select {
    ((_x # 0) isEqualTo "Sync") && {(_x # 1) isKindOf "EmptyDetector"}
  };

  if (_syncedTriggers isEqualTo []) then {
    _warnings pushBack [
      LLSTRING(units3DENComp_Warning_NoSyncedTrigger),
      LLSTRING(units3DENComp_Warning_NoSyncedTrigger_Desc)
    ];
  };
};

private _dataSaved = (_module get3DENAttribute QGVAR(dataSaved)) # 0;
private _mode = _values getVariable [QGVAR(mode), 0];

if (_mode isEqualTo 0) then {
  _warnings pushBack [
    LLSTRING(units3DENComp_Warning_EditMode),
    LLSTRING(units3DENComp_Warning_EditMode_Desc),
    QGVAR(mode)
  ];

  private _validEntityIndex = (get3DENConnections _module) findIf {
    _x params ["_type", "_entity"];
    (_type isEqualTo "Sync" && {
      (_entity isKindOf "CAManBase") || {_entity isKindOf "AllVehicles"}
    })
  };
  if (_validEntityIndex isEqualTo -1) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(units3DENComp_Warning_NoUnits_Desc)
    ];
  };
};

if ((_mode isEqualTo 1) && _dataSaved) then {
  private _data = (_module get3DENAttribute QGVAR(data)) # 0;

  if (_data isEqualTo "" || {_data isEqualTo "[[],[]]"}) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(units3DENComp_Warning_NoSavedUnits_Desc)
    ];
  };
};

_warnings
