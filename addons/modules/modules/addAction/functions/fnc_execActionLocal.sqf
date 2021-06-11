#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Executes action on client
 */

params ["_target", "_player", "_logic"];
TRACE_3("execActionLocal",_target,_player,_logic);

private _actionVar = format [QGVAR(%1_executed), _logic getVariable [QGVAR(id), ""]];

// Mark action as executed
if !(missionNamespace getVariable [_actionVar, false]) then {
  TRACE_1("execActionLocal: marking action as executed",_actionVar);
  missionNamespace setVariable [_actionVar, true, true];
};

// Exec action handler
if (_logic getVariable [QGVAR(addScriptHandler), false]) then {
  private _scriptHandler = _logic getVariable [QGVAR(scriptHandler), ""];
  [_target, _player, _logic] call (compile _scriptHandler);
};

[QGVAR(addAction_actionExecuted), [_target, _player, _logic]] call CBA_fnc_serverEvent;
