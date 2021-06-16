#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles action executed on server
 */

params ["_target", "_player", "_logic"];
TRACE_3("handleActionExecuted",_target,_player,_logic);

if (!isServer || {isNull _logic}) exitWith {};

// Change task state
_logic call FUNC(handlerModuleChangeTaskState);

// Play sound
[_logic, false] call FUNC(modulePlaySound);

// Set logic flag value
[_logic, false] call FUNC(moduleSetLogicFlagValue);

// Exec server action handler
if (_logic getVariable [QGVAR(addServerScriptHandler), false]) then {
  private _scriptHandler = _logic getVariable [QGVAR(serverScriptHandler), ""];
  [_target, _player, _logic] call (compile _scriptHandler);
};

// Delete target
if (_logic getVariable [QGVAR(deleteTarget), false]) then {
  deleteVehicle _target;
};

// Remove module if action disposable
if (_logic getVariable [QGVAR(isDisposable), true]) then {
  private _jipId = format [QGVAR(addActionId_%1), _logic call BIS_fnc_netId];
  TRACE_4("handleActionExecuted removing action - disposable",_target,_player,_logic,_jipId);
  // Overwrite event so JIP clients don't create this action
  [QGVAR(addAction), [objNull], _jipId] call CBA_fnc_globalEventJIP;
  // Delete module
  deleteVehicle _logic;
};
