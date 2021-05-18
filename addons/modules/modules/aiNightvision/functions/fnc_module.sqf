#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(aiNightvision)
/*
 * Author: SzwedzikPL
 * aiNightvision module function
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

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Mark module as executed to prevent double execution
_logic setVariable [QGVAR(executed), true, true];

// Update module debug status
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Load logic params
private _className = _logic getVariable [QGVAR(className), ""];

if (_className isEqualTo "") exitWith {
  // TODO: Error?
};

private _func = compile format ["
  [{
    params [""_unit""];
    if (isPlayer _unit || {_unit in playableUnits}) exitWith {};
    _unit linkItem ""%1"";
  }, _this] call CBA_fnc_execNextFrame;
", _className];

["CAManBase", "init", _func, true, [], true] call CBA_fnc_addClassEventHandler;

// Delete logic
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
