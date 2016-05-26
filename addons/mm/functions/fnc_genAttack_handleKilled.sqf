/*
 * Author: SzwedzikPL
 * Killed handler for genAttack units
 */
#include "script_component.hpp"

params ["_unit"];

if (!isServer) exitWith {_this remoteExecCall [QFUNC(genAttack_handleKilled), 2, false];};

private _unitLogic = _unit getVariable [QGVAR(genAttack_logic), objNull];
private _unitGroup = _unit getVariable [QGVAR(genAttack_group), grpNull];
//Update alive units in logic data
private _aliveLogicUnits = _unitLogic getVariable [QGVAR(genAttack_aliveUnits), []];
_aliveLogicUnits deleteAt (_aliveLogicUnits find _unit);
_unitLogic setVariable [QGVAR(genAttack_aliveUnits), _aliveLogicUnits];
//Remove group from alive if empty
private _aliveUnits = {alive _x} count (units _unitGroup);
if (isNull _unitGroup || _aliveUnits == 0) then {
    private _aliveLogicGroups = _unitLogic getVariable [QGVAR(genAttack_aliveGroups), []];
    _aliveLogicGroups deleteAt (_aliveLogicGroups find _unitGroup);
    _unitLogic setVariable [QGVAR(genAttack_aliveGroups), _aliveLogicGroups];
};

//Check if some units can be respawned
_unitLogic call FUNC(genAttack_genUnits);
