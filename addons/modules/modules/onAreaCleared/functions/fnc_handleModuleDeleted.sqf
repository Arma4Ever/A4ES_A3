#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * "Some module" deleted handler for onAreaCleared module function
 */

params ["_logic"];
TRACE_1("handleModuleDeleted",_logic);

if (isNull _logic) exitWith {};

if (_logic getVariable [QGVAR(addedToActivator), false]) exitWith {
  TRACE_1("Adding module to activator aborted - module already added",_logic);
};

private _modules = _logic getVariable [QGVAR(handlerModules), []];
private _index = _modules findIf {!(isNull _x)};

if (_index isNotEqualTo -1) exitWith {
  TRACE_3("Adding module to activator aborted - some synced modules still present",_logic,_modules,_index);
};

// Add activation ehs
_logic call FUNC(onAreaCleared_addActivationEHs);
