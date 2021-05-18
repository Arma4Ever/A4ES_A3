#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(generateSoldiers)
/*
 * Author: SzwedzikPL
 * generateSoldiers module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

// Mark module as executed to prevent future executions
_logic setVariable [QGVAR(executed), true, true];

LOG('Starting init of EXEC_MODULE_NAME.');

private _activationMode = _logic getVariable [QGVAR(activationMode), 0];

// Exec module if activated & activation mode by trigger
if (_activationMode isEqualTo 2) exitWith {
  // Add extra sync time if module is executed on mission start
  if (CBA_missionTime < 15) then {
    sleep 5;
  };

  if (_logic getVariable [QGVAR(activationDelay), false]) then {
    [
      {_this call FUNC(generateSoldiers_moduleExec)},
      [_logic],
      _logic getVariable [QGVAR(activationDelayTime), 0]
    ] call CBA_fnc_waitAndExecute;
    LOG('Init of EXEC_MODULE_NAME finished - exection delayed.');
  } else {
    _logic call FUNC(generateSoldiers_moduleExec);
    LOG('Init of EXEC_MODULE_NAME finished - executed.');
  };
};

// Add module to activator system
[_logic, _activationMode, QFUNC(generateSoldiers_moduleExec)] call FUNC(addModuleToActivator);

LOG('Init of EXEC_MODULE_NAME finished - added to activator.');

true
