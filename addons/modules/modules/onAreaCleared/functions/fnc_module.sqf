#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onAreaCleared module function
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
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Get synced modules
private _modules = (synchronizedObjects _logic) select {_x isKindOf QGVAR(base)};

// No synced modules
if (_modules isEqualTo []) exitWith {
  [{
    _this call FUNC(onAreaCleared_addActivationEHs);
  }, _logic, 10] call CBA_fnc_waitAndExecute;
  LOG('Execution of EXEC_MODULE_NAME finished - activation ehs added.');
};

// Save synced modules
_logic setVariable [QGVAR(handlerModules), _modules];

private _logicVar = format [QGVAR(onAreaCleared_%1), _logic call BIS_fnc_netId];
missionNamespace setVariable [_logicVar, _logic];

TRACE_2("onAreaCleared - adding deleted handlers",_logicVar,_modules);

private _deletedHandler = compile format ["
  [{isNull _this}, {
    (missionNamespace getVariable ['%1', objNull]) call %2;
  }, _this # 0] call CBA_fnc_waitUntilAndExecute;
", _logicVar, QFUNC(onAreaCleared_handleModuleDeleted)];

{
  _x addEventHandler ["deleted", _deletedHandler];
} forEach _modules;

LOG('Execution of EXEC_MODULE_NAME finished - deleted handlers added.');
