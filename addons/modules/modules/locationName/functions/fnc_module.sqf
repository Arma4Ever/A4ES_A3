#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * locationName module function
 */

params ["_mode", "_input"];
TRACE_2(QUOTE(EXEC_MODULE_NAME),_mode,_input);

if (
  (_mode isEqualTo "attributesChanged3DEN") ||
  {_mode isEqualTo "registeredToWorld3DEN"}
) exitWith {
  _input params ["_logic"];
  _logic call FUNC(locationName_moduleExecEditor);
};

if (_mode isEqualTo "unregisteredFromWorld3DEN") exitWith {
  _logic call FUNC(locationName_restorePreviousLocation);
};

// Exit if module executed not on server or not in init mode
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

private _mapLocation = nearestLocation [_logic, ""];
private _locationType = _logic getVariable [QGVAR(locationType), "Invisible"];	
private _customName = _logic getVariable [QGVAR(customName), ""];

[QGVAR(locationName), [_mapLocation, _customName, _locationType]] call CBA_fnc_globalEventJIP;

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');