#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(nameRadioChannels)
/*
 * Author: SzwedzikPL
 * nameRadioChannels module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};



LOG('Execution of EXEC_MODULE_NAME finished.');
