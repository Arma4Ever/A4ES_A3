#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if unit can join target unit squad
 */

params ["_unit", "_target"];

private _unitSquad = _unit call FUNC(getUnitSquad);
private _targetSquad = _target call FUNC(getUnitSquad);

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {(side group _unit) isEqualTo (side group _target)}
// Different squads or both squads are null (if target squad is null then
// new squad will be created and both units will join it)
&& {
  (_unitSquad isNotEqualTo _targetSquad)
  || {isNull _unitSquad && {isNull _targetSquad}}
}
