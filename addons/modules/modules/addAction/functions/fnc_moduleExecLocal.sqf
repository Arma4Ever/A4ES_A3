#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addAction module local exec function
 */

params ["_logic", "_targets", "_condition"];
TRACE_3("addAction_moduleExecLocal",_logic,_targets,_condition);

if (!hasInterface || {isNull _logic}) exitWith {
  TRACE_1("addAction_moduleExecLocal abort: no interface or logic null",_logic);
};

private _owner = _logic getVariable [QGVAR(owner), 0];
if !([player, _owner] call FUNC(addAction_isActionOwner)) exitWith {
  TRACE_2("addAction_moduleExecLocal abort: player not owner",_logic,_owner);
};

private _validTargets = _targets select {!(isNull _x)};
if (_validTargets isEqualTo []) exitWith {
  TRACE_1("addAction_moduleExecLocal abort: no valid targets",_targets);
};

private _actionId = format [QGVAR(%1), _logic getVariable [QGVAR(id), ""]];
private _actionTitle = _logic getVariable [QGVAR(title), ""];
private _actionIcon = _logic getVariable [QGVAR(icon), ""];
private _actionType = _logic getVariable [QGVAR(type), 0];
private _actionPath = ["ACE_MainActions", "ACE_SelfActions"] select _actionType;
private _actionStatement = QUOTE(_this call FUNC(addAction_execActionLocal));

// Update statement and save condition for progress
if (_logic getVariable [QGVAR(progress), false]) then {
  _actionStatement = QUOTE(_this call FUNC(addAction_execActionProgressLocal));
  _logic setVariable [QGVAR(localProgressCondition), _condition];
};

TRACE_6("addAction_moduleExecLocal - adding action",_actionId,_actionTitle,_actionIcon,_actionStatement,_condition,_logic);

private _action = ([
  _actionId,
  _actionTitle call EFUNC(common,localize),
  _actionIcon,
  compile _actionStatement,
  compile _condition,
  {},
  _logic
] call ACEFUNC(interact_menu,createAction));

{
  [_x, _actionType, [_actionPath], _action] call ACEFUNC(interact_menu,addActionToObject);
} forEach _validTargets;
