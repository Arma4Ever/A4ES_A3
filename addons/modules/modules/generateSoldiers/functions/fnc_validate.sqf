#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for generateSoldiers module
 */

params ["_module", "_values"];

private _warnings = [];
private _syncedTriggers = (get3DENConnections _module) select {
  ((_x # 0) isEqualTo "Sync") && {(_x # 1) isKindOf "EmptyDetector"}
};

if (_syncedTriggers isEqualTo []) then {
  _warnings pushBack [
    localize LSTRING(generateSoldiers_Warning_NoSyncedTrigger),
    localize LSTRING(generateSoldiers_Warning_NoSyncedTrigger_Desc)
  ];
};

LAST_VAL = _values;

if ((_values getVariable [QGVAR(source), 0]) isEqualTo 0) then {
  private _classList = call compile (_values getVariable [QGVAR(classList), "[]"]);

  if (!(_classList isEqualType []) || ((count _classList) isEqualTo 0)) then {
    _warnings pushBack [
      localize LSTRING(Warning_ModuleHasNoEffect),
      localize LSTRING(generateSoldiers_Warning_EmptyClasslist_Desc),
      QGVAR(classList)
    ];
  };
} else {
  private _compositionId = _values getVariable [QGVAR(composition), ""];
  if (_compositionId isEqualTo "") then {
    _warnings pushBack [
      localize LSTRING(Warning_ModuleHasNoEffect),
      localize LSTRING(generateSoldiers_Warning_NoComposition_Desc),
      QGVAR(composition)
    ];
  };
};

_warnings
