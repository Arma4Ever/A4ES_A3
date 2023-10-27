#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * suppliesStorage module function
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

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

LOG('Starting init of EXEC_MODULE_NAME.');
private _storageID = _logic getVariable [QGVAR(storageID), ""];
private _modules = (synchronizedObjects _logic) select {_x isKindOf QGVAR(suppliesObject)};
private _moduleObjects = [];
private _objects = [];
private _id = "";
private _side = "west";

{
  _id = _x getVariable [QGVAR(id), ""];
  _objects = missionNamespace getVariable [format [QGVAR(supplies_%1), _id], []];
  _side = [west, east, resistance, civilian] select (_x getVariable [QGVAR(side), 0]);

  _moduleObjects = missionNamespace getVariable [format [QGVAR(storage_%1_%2), _storageID, _side], []];
  _moduleObjects pushback _objects;
  missionNamespace setVariable [format [QGVAR(storage_%1_%2), _storageID, _side], _moduleObjects, true];
  
  deleteVehicle _x;
} forEach _modules;

private _target = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector") || !(_x isKindOf QGVAR(suppliesObject))};

// Send global event and save for JIP
[QGVAR(addSuppliesAction), [_logic, _target, _storageID]] call CBA_fnc_globalEventJIP;

// Delete module
deleteVehicle _logic;

LOG('Init of EXEC_MODULE_NAME finished - executed.');