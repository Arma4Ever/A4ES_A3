#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addAction module local exec function
 */

params ["_logic"];
TRACE_1("addAction_moduleExec",_logic);

if (!hasInterface || {isNull _logic}) exitWith {};

/*

params [""]

private _actionVar = format [QGVAR(%1_executed), _actionId];
if (_isDisposable) then {
  _condition = (format [
    "(missionNamespace getVariable ['%1', false]) && {", _actionVar
  ]) + _condition + "}";
};

_condition = compile _condition;

_statement = (format [
  "['%1', ['%2', ace_player]] call CBA_fnc_serverEvent;",
  QGVAR(actionExecuted),
  _actionId
]) + _statement;

if (_progressTime > 0) then {
  [_progressTime, [], {Hint "Finished!"}, {hint "Failure!"}, _progressTitle, _condition] call ace_common_fnc_progressBar;
};


*/
