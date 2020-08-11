#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(generateSoldiers)
/*
 * Author: SzwedzikPL
 * generateSoldiers module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Mark module as executed to prevent future executions
_logic setVariable [QGVAR(executed), true, true];

// Add extra sync time if module is executed on mission start
if (CBA_missionTime < 30) then {
  sleep 10;
};

// Get logic area
private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

// Calc behaviour boundary area
private _boundaryArea = switch (_logic getVariable [QGVAR(behaviourAreaBoundary), 0]) do {
    case 0: {[]};
    case 1: {_logicArea};
    case 2: {
      private _syncedTriggers = (synchronizedObjects _logic) select {
        _x isKindOf "EmptyDetector"
      };
      if (_syncedTriggers isEqualTo []) then {
        []
      } else {
        private _trigger = _syncedTriggers # 0;
        private _triggerArea = [getPos _trigger];
        _triggerArea append (triggerArea _trigger);
        _triggerArea
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
  [_logic, _logicArea, _boundaryArea] remoteExec [QFUNC(generateSoldiers_moduleExec), owner EGVAR(headless,headlessClient)];
} else {
  // Exec on server
  LOG('Spawning EXEC_MODULE_NAME exec function on server');
  [_logic, _logicArea, _boundaryArea] spawn FUNC(generateSoldiers_moduleExec);
};

LOG('Execution of EXEC_MODULE_NAME finished.');

true
