#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addCuratorModule module function
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
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Load logic params
private _category = _logic getVariable [QGVAR(category), ""];
private _name = _logic getVariable [QGVAR(name), ""];
private _icon = _logic getVariable [QGVAR(icon), "\a3\modules_f\data\portraitmodule_ca.paa"];
private _function = _logic getVariable [QGVAR(function), ""];

if (_category isEqualTo "") exitWith {
  WARNING('EXEC_MODULE_NAME - empty module category.');
};
if (_name isEqualTo "") exitWith {
  WARNING('EXEC_MODULE_NAME - empty module name.');
};
if (_function isEqualTo "") exitWith {
  WARNING('EXEC_MODULE_NAME - empty module function name.');
};

private _jipId = format [QGVAR(addCuratorModule_%1), _logic call BIS_fnc_netId];

// Create global jip event
[QGVAR(addCuratorModule), [_category, _name, _icon, _function], _jipId] call CBA_fnc_globalEventJIP;

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
