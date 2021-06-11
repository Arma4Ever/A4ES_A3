#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onDeleted module exec function
 */

params ["_logic"];
TRACE_1("onDeleted_moduleExec",_logic);

if (isNull _logic) exitWith {};

private _objects = _logic getVariable [QGVAR(handlerObjects), []];
private _notNullIndex = _objects findIf {!(isNull _x)};

if (_notNullIndex isNotEqualTo -1) exitWith {
  TRACE_3("onDeleted_moduleExec - abort, not all objects deleted",_logic,_objects,_notNullIndex);
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Change task state
_logic call FUNC(handlerModuleChangeTaskState);

// Play sound
[_logic, false] call FUNC(modulePlaySound);

// Set logic flag value
[_logic, false] call FUNC(moduleSetLogicFlagValue);

// Call script handler
if (_logic getVariable [QGVAR(addScriptHandler), false]) then {
  [_logic] call compile (_logic getVariable [QGVAR(scriptHandler), ""]);
};

// Delete module
deleteVehicle _logic;
