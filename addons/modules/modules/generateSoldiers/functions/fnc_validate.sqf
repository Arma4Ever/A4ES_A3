#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for generateSoldiers module
 */

params ["_module", "_values"];

private _warnings = [];

if ((_values getVariable [QGVAR(activationMode), 0]) isEqualTo 3) then {
  private _syncedTriggers = (get3DENConnections _module) select {
    ((_x # 0) isEqualTo "Sync") && {(_x # 1) isKindOf "EmptyDetector"}
  };

  if (_syncedTriggers isEqualTo []) then {
    _warnings pushBack [
      LLSTRING(generateSoldiers_Warning_NoSyncedTrigger),
      LLSTRING(generateSoldiers_Warning_NoSyncedTrigger_Desc)
    ];
  };
};

if ((_values getVariable [QGVAR(source), 0]) isEqualTo 0) then {
  private _classList = parseSimpleArray (_values getVariable [QGVAR(classList), "[]"]);

  if (!(_classList isEqualType []) || ((count _classList) isEqualTo 0)) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(generateSoldiers_Warning_EmptyClasslist_Desc),
      QGVAR(classList)
    ];
  };
} else {
  private _compositionId = _values getVariable [QGVAR(composition), ""];
  if (_compositionId isEqualTo "") then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(generateSoldiers_Warning_NoComposition_Desc),
      QGVAR(composition)
    ];
  };
};

_warnings
