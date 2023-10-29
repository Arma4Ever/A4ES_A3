#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * suppliesObject module exec function
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

// Load logic params
private _id = _logic getVariable [QGVAR(id), ""];
private _objectName = _logic getVariable [QGVAR(name), ""];
private _objectCount = _logic getVariable [QGVAR(objectCount), 0];
private _deleteObject = _logic getVariable [QGVAR(deleteObject), ""];
private _side = [west, east, resistance, civilian] select (_logic getVariable [QGVAR(side), 0]);

// Get synced vehicle or object with cargo space
private _object = (synchronizedObjects _logic) select {(_x isKindOf "AllVehicles") || {_x isKindOf "ReammoBox_F"}};

// Exit if there're no synced object
if ((count _object) isEqualTo 0) exitWith {
  LOG_1('Execution of EXEC_MODULE_NAME aborted - no synced object.');
  deleteVehicle _logic;
};

_object = _object#0;
// Get object content
private _items = [];
private _cargo = getItemCargo _object;
{_items pushBack [_x, (_cargo # 1) # _forEachIndex];} forEach (_cargo #0);

// Save object
LOG_2('Saving object "%1"',_objectName);
private _class = typeOf _object;
private _pos = getPosASL _logic;

private _objectPostInit = "";
if (_logic getVariable [QGVAR(addObjectPostInit), false]) then {
  _objectPostInit = compile (_logic getVariable [QGVAR(_objectPostInit), ""]);
};

private _objects = [_objectName, _class, _objectCount, _pos, _items, _objectPostInit];
missionNamespace setVariable [format [QGVAR(supplies_%1), _id], _objects];

// Delete object
if (_deleteobject) then {
  LOG('Deleting saved object of EXEC_MODULE_NAME.');
  deleteVehicle _object;
};

LOG('Execution of EXEC_MODULE_NAME finished.');
