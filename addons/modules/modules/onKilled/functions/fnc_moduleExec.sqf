#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onKilled module exec function
 */

params ["_logic"];
TRACE_1("onKilled_moduleExec",_logic);

if (isNull _logic) exitWith {};

private _objects = _logic getVariable [QGVAR(handlerObjects), []];
private _aliveIndex = _objects findIf {alive _x};

if (_aliveIndex isNotEqualTo -1) exitWith {
  TRACE_3("onKilled_moduleExec - abort, not all objects killed",_logic,_objects,_aliveIndex);
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Remove handler from objects
{
  if !(isNull _x) then {
    private _handlers = _x getVariable [QGVAR(onKilledHandlers), []];
    _handlers deleteAt (_handlers find _logic);
    _x setVariable [QGVAR(onKilledHandlers), _handlers];
  };
} forEach _objects;

// Remove killed mission EH
_logic call FUNC(onKilled_removeMissionEH);

// Change task state
_logic call FUNC(handlerModuleChangeTaskState);

// Play sound
[_logic, false] call FUNC(modulePlaySound);

// Set logic flag value
[_logic, false] call FUNC(moduleSetLogicFlagValue);

// Call script handler
if (_logic getVariable [QGVAR(addScriptHandler), false]) then {
  [_logic, _objects] call compile (_logic getVariable [QGVAR(scriptHandler), ""]);
};

// Delete module
deleteVehicle _logic;
