#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if a given unit can remove target unit from squad
 */

params ["_unit", "_target"];

private _unitSquad = _unit call FUNC(getUnitSquad);
private _targetSquad = _target call FUNC(getUnitSquad);

if ((isNull _unitSquad) || {isNull _targetSquad}) exitWith {false};

private _unitSquadLeader = _unitSquad call FUNC(getSquadLeader);

(_unitSquad isEqualTo _targetSquad)
&& {(_unitSquadLeader isEqualTo _unit) || {!alive _target}}
