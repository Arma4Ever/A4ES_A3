/*
 * Author: SzwedzikPL
 * Killed handler for genSoldier units
 */
#include "script_component.hpp"

params ["_unit"];

if(!isServer) exitWith {_this remoteExecCall [QFUNC(genSoldiers_handleKilled), 2, false];};

private _unitPlace = _unit getVariable [QGVAR(genSoldiers_place), objNull];
private _unitGroup = _unit getVariable [QGVAR(genSoldiers_group), grpNull];

//Update alive units in place data
private _alivePlaceUnits = _unitPlace getVariable [QGVAR(genSoldiers_aliveUnits), []];
_alivePlaceUnits deleteAt (_alivePlaceUnits find _unit);
_unitPlace setVariable [QGVAR(genSoldiers_aliveUnits), _alivePlaceUnits];

//Remove group from alive if empty
private _alivePlaceGroups = _unitPlace getVariable [QGVAR(genSoldiers_aliveGroups), []];
private _aliveUnits = {alive _x} count (units _unitGroup);
if(isNull _unitGroup || _aliveUnits==0) then {_alivePlaceGroups deleteAt (_alivePlaceGroups find _unitGroup);};
_unitPlace setVariable [QGVAR(genSoldiers_aliveGroups), _alivePlaceGroups];

//Call support units
private _childUnits = _unitPlace getVariable [QGVAR(genSoldiers_children), []];
{
    private _childUnitPlace = _x;
    private _childUnitRespawned = _childUnitPlace getVariable [QGVAR(genSoldiers_respawned), false];
    private _childUnitsCalled = _childUnitPlace getVariable [QGVAR(genSoldiers_called), false];
    if(_childUnitRespawned && !_childUnitsCalled) then {
        if(!isMultiplayer) then {systemchat "genSoldiers - Wzywam wsparcie";};
        A3CS_LOGINFO("genSoldiers_handleKilled: Wzywam wsparcie")
        _childUnitPlace setVariable [QGVAR(genSoldiers_called), true];
        [_childUnitPlace, _unitPlace] call FUNC(genSoldiers_callSupport);
    };
} forEach _childUnits;
