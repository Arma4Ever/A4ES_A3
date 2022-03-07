#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * fortifySettings module function
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

private _side = [west, east, resistance, civilian] select (_logic getVariable [QGVAR(side), 0]);
private _objectClass = _logic getVariable [QGVAR(objectClass), ""];
private _objectCost = _logic getVariable [QGVAR(objectCost), 0];

if (_objectClass == "" || {!(isClass (configFile >> "CfgVehicles" >> _objectClass))}) exitWith {
  WARNING_1('EXEC_MODULE_NAME - invalid object class - %1',_objectClass);
};
private _objectsVar = format ["ace_fortify_Objects_%1", _side];
private _objects = missionNamespace getVariable [_objectsVar, []];
_objects pushBack [_objectClass, _objectCost];
missionNamespace setVariable [_objectsVar, _objects, true];

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
