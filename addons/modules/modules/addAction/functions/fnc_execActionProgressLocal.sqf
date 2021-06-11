#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Executes action progress bar on client
 */

params ["_target", "_player", "_logic"];
TRACE_3("execActionProgressLocal",_target,_player,_logic);

private _hasProgress = _logic getVariable [QGVAR(progress), false];

if (!_hasProgress) exitWith {
  TRACE_3("execActionProgressLocal abort, action has no progress",_target,_player,_logic);
  _this call FUNC(addAction_execActionLocal);
};

private _progressTime = _logic getVariable [QGVAR(progressTime), 5];
private _progressTitle = _logic getVariable [QGVAR(progressTitle), ""];

private _onFail = "";
if (_logic getVariable [QGVAR(addProgressFailedScriptHandler), false]) then {
  _onFail = _logic getVariable [QGVAR(progressFailedScriptHandler), ""];
};

private _progressCondition = _logic setVariable [QGVAR(localProgressCondition), "true"];

[
  _progressTime,
  [_target, _player, _logic],
  {(_this # 0) call FUNC(addAction_execActionLocal)},
  compile ("(_this # 0) call {" + _onFail + "}"),
  _progressTitle,
  compile ("(_this # 0) call {" + _progressCondition + "}")
] call ace_common_fnc_progressBar;
