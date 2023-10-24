#include "script_component.hpp"
/*
 * Author: Krzyciu,SzwedzikPL
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

LOG('Starting init of EXEC_MODULE_NAME.');

private _target = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")};

// Send global event and save for JIP
[QGVAR(addSuppliesAction), [_logic, _target]] call CBA_fnc_globalEventJIP;

// Delete module
deleteVehicle _logic;

LOG('Init of EXEC_MODULE_NAME finished - executed.');