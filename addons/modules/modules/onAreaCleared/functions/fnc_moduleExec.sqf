#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onAreaCleared module exec function
 */

params ["_logic"];
TRACE_1("onAreaCleared_moduleExec",_logic);

if (isNull _logic) exitWith {};

if !(_logic call (_logic getVariable [QGVAR(activationCond), {false}])) exitWith {
  TRACE_1("onAreaCleared_moduleExec - abort, area not cleared yet",_logic);
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Cleanup EH & PFH
(_logic getVariable QGVAR(activationEHs)) params ["_killedEH", "_actPFH"];
removeMissionEventHandler ["EntityKilled", _killedEH];
[_actPFH] call CBA_fnc_removePerFrameHandler;

// Change task state
_logic call FUNC(handlerModuleChangeTaskState);

// Call script handler
if (_logic getVariable [QGVAR(addScriptHandler), false]) then {
  [_logic] call compile (_logic getVariable [QGVAR(scriptHandler), ""]);
};

// Delete module
deleteVehicle _logic;
