/*
 * Author: SzwedzikPL
 * Killed handler for genSoldier units
 */
#include "script_component.hpp"

params ["_unit"];

if (!isServer) exitWith {_this remoteExecCall [QFUNC(genSoldiers_handleKilled), 2, false];};

private _unitLogic = _unit getVariable [QGVAR(genSoldiers_logic), objNull];
private _unitGroup = _unit getVariable [QGVAR(genSoldiers_group), grpNull];

//Update alive units in place data
private _alivePlaceUnits = _unitLogic getVariable [QGVAR(genSoldiers_aliveUnits), []];
_alivePlaceUnits deleteAt (_alivePlaceUnits find _unit);
_unitLogic setVariable [QGVAR(genSoldiers_aliveUnits), _alivePlaceUnits];
//api
_unitLogic setVariable [QGVAR(genSoldiers_aliveUnitsCount), count _alivePlaceUnits, true];

//Remove group from alive if empty
private _alivePlaceGroups = _unitLogic getVariable [QGVAR(genSoldiers_aliveGroups), []];
private _aliveUnits = {alive _x} count (units _unitGroup);
if (isNull _unitGroup || _aliveUnits == 0) then {_alivePlaceGroups deleteAt (_alivePlaceGroups find _unitGroup);};
_unitLogic setVariable [QGVAR(genSoldiers_aliveGroups), _alivePlaceGroups];

//Call support units
private _childUnits = _unitLogic getVariable [QGVAR(genSoldiers_children), []];
{
    private _childUnitLogic = _x;
    private _childUnitRespawned = _childUnitLogic getVariable [QGVAR(genSoldiers_respawned), false];
    private _childUnitsCalled = _childUnitLogic getVariable [QGVAR(genSoldiers_called), false];
    if (_childUnitRespawned && !_childUnitsCalled) then {
        if (!isMultiplayer) then {systemchat "genSoldiers - Wzywam wsparcie";};
        LOG("genSoldiers_handleKilled: Wzywam wsparcie");
        _childUnitLogic setVariable [QGVAR(genSoldiers_called), true];
        [_childUnitLogic, _unitLogic] call FUNC(genSoldiers_callSupport);
    };
} forEach _childUnits;
