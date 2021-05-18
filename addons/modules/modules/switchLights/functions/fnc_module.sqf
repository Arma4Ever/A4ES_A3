#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(switchLights)
/*
 * Author: SzwedzikPL
 * switchLights module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);

if (is3DENPreview) then {
  [_logic, _isActivated] call EFUNC(debug,updateModuleStatus);
};

private _mode = ["ON", "OFF"] select _isActivated;
private _jipId = format [QGVAR(switchLightsId_%1), _logic call BIS_fnc_netId];

// Send global event and save for JIP
[QGVAR(switchLightsLocal), [_logic, _mode, CBA_missionTime], _jipId] call CBA_fnc_globalEventJIP;

// ---------------------------

LOG('Execution of EXEC_MODULE_NAME finished.');

true
