#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * createLogicFlag module function
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

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

private _id =  _logic getVariable [QGVAR(id), ""];
if (_id isEqualTo "") exitWith {
  ERROR("Flag id is missing");
};

private _initialValue = _logic getVariable [QGVAR(initialValue), 0];
if !(_initialValue in [0, 1]) exitWith {
  ERROR_1("Invalid flag initial value",str _initialValue);
};

private _value = [false, true] select _initialValue;

GVAR(createdLogicFlags) set [_id, _value];

private _title = _logic getVariable [QGVAR(title), ""];
if (_title == "") then {_title = _id;};
GVAR(logicFlagTitles) set [_id, _title];

// Save titles in 3den preview for logs of change
if (is3DENPreview) then {
  [_logic, "Tworze flage logiczna '%1' z wartoscia %2", _title, str _value] call EFUNC(debug,moduleLog);
};

private _flagVar = format [QGVAR(%1), _id];
missionNamespace setVariable [_flagVar, _value, true];

deleteVehicle _logic;

LOG('Init of EXEC_MODULE_NAME finished - executed.');
