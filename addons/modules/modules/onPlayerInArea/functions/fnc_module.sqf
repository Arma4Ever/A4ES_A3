#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onPlayerInArea module function
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

private _activationDelay = _logic getVariable [QGVAR(activationDelay), false];
private _activationDelayTime = [
  0,
  _logic getVariable [QGVAR(activationDelayTime), 0]
] select _activationDelay;

private _activationArea = _logic call EFUNC(common,getLogicArea);
private _condition = [_logic, 0, _activationArea] call FUNC(getModuleActivatorCond);

// Add module to activator system
[_logic, _condition, _logic, QUOTE(EXEC_MODULE_FNC), _activationDelayTime] call FUNC(addModuleToActivator);
LOG('Init of EXEC_MODULE_NAME finished - added to activator.');
