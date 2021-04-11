#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given unit can become squad leader
 */

params ["_unit"];

private _squad = _unit call FUNC(getUnitSquad);
if (isNull _squad) exitWith {false};

private _leader = _squad call FUNC(getSquadLeader);

(_leader isNotEqualTo _unit)
