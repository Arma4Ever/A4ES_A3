#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Ambient flyby function
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
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

LOG('Starting init of EXEC_MODULE_NAME.');

#include "\z\a3cs\addons\modules\includes\moduleActivation.sqf"

LOG('Init of EXEC_MODULE_NAME finished.');
