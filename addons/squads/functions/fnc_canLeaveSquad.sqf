#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if a given unit can leave squad
 */

params ["_unit"];

private _squad = _unit call FUNC(getUnitSquad);
if (isNull _squad) exitWith {false};

private _squadUnits = _squad call FUNC(getSquadUnits);

(count _squadUnits) > 1
