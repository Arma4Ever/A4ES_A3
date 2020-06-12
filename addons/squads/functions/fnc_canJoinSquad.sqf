#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given unit can join squad
 */

params ["_unit", "_target"];

private _unitSquad = _unit call FUNC(getUnitSquad);
private _targetSquad = _target call FUNC(getUnitSquad);

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {(side group _unit) isEqualTo (side group _target)}
&& {
  !(_unitSquad isEqualTo _targetSquad)
  || {isNull _unitSquad && {isNull _targetSquad}}
}
