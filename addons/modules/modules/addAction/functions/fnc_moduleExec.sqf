#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addAction module exec function
 */

params ["_logic"];
TRACE_1("addAction_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

private _targets = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")};
private _condition = "!(isNull (_this # 2))";

if (_logic getVariable [QGVAR(isDisposable), true]) then {
  private _actionVar = format [QGVAR(%1_executed), _logic getVariable [QGVAR(id), ""]];
  _condition = _condition + format ["&& {!(missionNamespace getVariable ['%1', false])}", _actionVar];
};

private _conditionType = _logic getVariable [QGVAR(conditionType), 1];

if (_conditionType isEqualTo 1) then {
  _condition = _condition + " && {" + (_logic getVariable [QGVAR(conditionScript), "true"]) + "}";
} else {
  private _logicFlags = parseSimpleArray (_logic getVariable [QGVAR(conditionLogicFlags), "[]"]);
  private _logicFlagsCond = _logicFlags call FUNC(getLogicFlagsCondition);
  _logicFlagsCond params ["_flagsCondition", "_flagsUsed"];
  if (_flagsCondition isEqualTo "" || {_flagsUsed isEqualTo []}) then {
    _flagsCondition = "false";
  };

  _condition = _condition + " && {missionNamespace call {" + _flagsCondition + "}}";
};

// Send global event and save for JIP
private _jipId = format [QGVAR(addActionId_%1), _logic call BIS_fnc_netId];
[QGVAR(addAction), [_logic, _targets, _condition], _jipId] call CBA_fnc_globalEventJIP;
