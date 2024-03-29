#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * generateSoldiers module function
 */

params ["_mode", "_input"];
TRACE_2(QUOTE(EXEC_MODULE_NAME),_mode,_input);

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null or placed by zeus (should not happen)
if (isNull _logic || !_isActivated || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

// Mark module as executed to prevent future executions
_logic setVariable [QGVAR(executed), true, true];

LOG('Starting init of EXEC_MODULE_NAME.');

#include "\z\a4es\addons\modules\includes\moduleActivation.inc.sqf"

LOG('Init of EXEC_MODULE_NAME finished - added to activator.');

true
