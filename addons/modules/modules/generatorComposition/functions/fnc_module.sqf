#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(generatorComposition)
/*
 * Author: SzwedzikPL
 * generatorComposition module function
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

LOG('Starting execution of EXEC_MODULE_NAME.');

// Mark module as executed to prevent double execution
_logic setVariable [QGVAR(executed), true, true];

// Load logic params
private _compositionId = _logic getVariable [QGVAR(id), ""];
private _deleteUnits = _logic getVariable [QGVAR(deleteUnits), ""];

// Get synced units
private _units = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};
// Exit if there're no synced units or more than one
if !((count _units) isEqualTo 1) exitWith {
  LOG_1('Execution of EXEC_MODULE_NAME aborted - no synced units (units: %1).',str _units);
};

// Get group units
private _group = group (_units # 0);
private _groupUnits = (units _group) select {isNull (objectParent _x)};

// Exit if there're no units "on foot" in group
if (_groupUnits isEqualTo []) exitWith {
  LOG_1('Execution of EXEC_MODULE_NAME aborted - no valid units (units: %1).',str _groupUnits);
};

// Save composition
LOG_2('Saving generator composition "%1" (units count: %2)',_compositionId,str (count _groupUnits));
missionNamespace setVariable [
  format [QGVAR(generatorComposition_id_%1), _compositionId],
  _groupUnits apply {[typeOf _x, getUnitLoadout _x]},
  // Make composition global so headless can use it
  true
];

// Delete units
if (_deleteUnits) then {
  LOG('Deleting saved units of EXEC_MODULE_NAME.');
  {deleteVehicle _x} forEach _groupUnits;

  // Try to remove group if is empty after units cleanup
  if ((units _group) isEqualTo []) then {
    LOG('Deleting group of saved units of EXEC_MODULE_NAME.');
    deleteGroup _group;
  };
};

LOG('Execution of EXEC_MODULE_NAME finished.');
