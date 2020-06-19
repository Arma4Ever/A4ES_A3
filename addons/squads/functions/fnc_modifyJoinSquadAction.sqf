#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds squad name to join squad action
 */

params ["_target", "_player", "", "_actionData"];

private _actionText = format ["%1: %2", localize LSTRING(JoinSquad), groupID group _target];
TRACE_3("",_target,group _target,_actionText);

_actionData set [1, _actionText];
