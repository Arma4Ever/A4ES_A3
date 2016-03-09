/*
 * Author: SzwedzikPL
 * Killed handler for genAttack units
 */
#include "script_component.hpp"

params ["_unit"];

if(!isServer) exitWith {_this remoteExecCall [QFUNC(genAttack_handleKilled), 2, false];};

private _unitPlace = _unit getVariable [QGVAR(genAttack_place), objNull];
private _unitGroup = _unit getVariable [QGVAR(genAttack_group), grpNull];
//Update alive units in place data
private _alivePlaceUnits = _unitPlace getVariable [QGVAR(genAttack_aliveUnits), []];
_alivePlaceUnits deleteAt (_alivePlaceUnits find _unit);
_unitPlace setVariable [QGVAR(genAttack_aliveUnits), _alivePlaceUnits];
//Remove group from alive if empty
private _aliveUnits = {alive _x} count (units _unitGroup);
if(isNull _unitGroup || _aliveUnits == 0) then {
    private _alivePlaceGroups = _unitPlace getVariable [QGVAR(genAttack_aliveGroups), []];
    _alivePlaceGroups deleteAt (_alivePlaceGroups find _unitGroup);
    _unitPlace setVariable [QGVAR(genAttack_aliveGroups), _alivePlaceGroups];
};

//Check if some units can be respawned
_unitPlace call FUNC(genAttack_genUnits);
