#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * generateSoldiers module exec function
 */

params ["_logic"];
TRACE_1("generateSoldiers_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Get logic area
private _logicArea = _logic call EFUNC(common,getLogicArea);

// Calc behaviour boundary area
private _boundaryArea = switch (_logic getVariable [QGVAR(behaviourAreaBoundary), 0]) do {
    case 0: {[]};
    case 1: {_logic getVariable ["objectarea", []]};
    case 2: {
      private _syncedTriggers = (synchronizedObjects _logic) select {
        _x isKindOf "EmptyDetector"
      };
      if (_syncedTriggers isEqualTo []) then {
        []
      } else {
        private _trigger = _syncedTriggers # 0;
        triggerArea _trigger
      };
    };
    default {[]}
};

// Call module exec function
if (
  isMultiplayer
  && {!(_logic getVariable [QGVAR(disableHeadless), false])}
  && {!(isNull EGVAR(headless,headlessClient))}
) then {
  // Exec on headless
  LOG_1('Spawning EXEC_MODULE_NAME exec function on headless (owner: %1)', str (owner EGVAR(headless,headlessClient)));
  [_logic, _logicArea, _boundaryArea] remoteExec [QFUNC(generateSoldiers_moduleExecLocal), owner EGVAR(headless,headlessClient)];
} else {
  // Exec on server
  LOG('Spawning EXEC_MODULE_NAME exec function on server');
  [_logic, _logicArea, _boundaryArea] spawn FUNC(generateSoldiers_moduleExecLocal);
};

LOG('Execution of EXEC_MODULE_NAME exec finished.');
