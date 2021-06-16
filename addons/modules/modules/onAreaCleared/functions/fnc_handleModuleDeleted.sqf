#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * "Some module" deleted handler for onAreaCleared module function
 */

params ["_logic"];
TRACE_1("handleModuleDeleted",_logic);

if (isNull _logic) exitWith {};

private _modules = _logic getVariable [QGVAR(handlerModules), []];
private _index = _modules findIf {!(isNull _x)};

if (_index isNotEqualTo -1) exitWith {
  TRACE_3("Adding module to activator aborted - some synced modules still present",_logic,_modules,_index);
};

// Add activation ehs
[{
  _this call FUNC(onAreaCleared_addActivationEHs);
}, _logic, 10] call CBA_fnc_waitAndExecute;
