#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds squad name to join squad action
 */

params ["_target", "_player", "", "_actionData"];

private _squad = _target call FUNC(getUnitSquad);
if (isNull _squad) exitWith {};

private _squadName = _squad getVariable ["name", ""];
if (_squadName isNotEqualTo "") then {
  _actionData set [1, format ["%1: %2", localize LSTRING(JoinSquad), _squadName]];
};
