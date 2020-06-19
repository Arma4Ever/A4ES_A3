#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if a given unit is a squad leader
 */

params ["_unit"];

if (isNull _unit) exitWith {false};

private _squad = _unit call FUNC(getUnitSquad);
if (isNull _squad) exitWith {false};

private _leader = _squad call FUNC(getSquadLeader);

_unit isEqualTo _leader
