#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * bodiesSettings module function
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
if (isNull _logic || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

private _enabled = _logic getVariable [QGVAR(systemEnabled), true];
private _bodiesLimit = _logic getVariable [QGVAR(bodiesLimit), 100];

// Log settings
["a4es_simpleBodiesSettings", [_enabled, _bodiesLimit]] call CBA_fnc_serverEvent;

if !(_enabled) then {
  missionNamespace setVariable [QEGVAR(bodies,systemDisabled), true, true];
} else {
  EGVAR(bodies,simpleBodiesLimit) = _bodiesLimit;
};

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
