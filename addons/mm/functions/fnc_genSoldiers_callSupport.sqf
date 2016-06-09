/*
 * Author: SzwedzikPL
 * call support of availble units
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_childLogic", "_parentLogic"];

private _childRespawned = _childLogic getVariable [QGVAR(genSoldiers_respawned), false];
if (!_childRespawned) exitWith {};

private _formation = _childLogic getvariable ["formation", "COLUMN"];
private _childGroups = _childLogic getVariable [QGVAR(genSoldiers_aliveGroups), []];
{
    private _group = _x;
    private _leader = leader _group;
    private _useVehicle = objNull;

    _nearestVehicles = _leader nearEntities [["Car", "Tank"], 50];
    {
        private _vehicle = _x;
        private _canGetIn = true;
        if (!canMove _vehicle) then {_canGetIn = false;};
        if (fuel _vehicle < 0.3) then {_canGetIn = false;};
        if (count (crew _vehicle) > 0) then {_canGetIn = false;};
        if (_vehicle getVariable [QGVAR(genSoldiers_usedByGroup), false]) then {_canGetIn = false;};
        //Count seats
        private _vehicleSeats = 0;
        if (getNumber (configFile >> "CfgVehicles" >> typeof _vehicle >> "hasDriver") > 0) then {_vehicleSeats = _vehicleSeats + 1;};
        _vehicleSeats = (count (allTurrets [_vehicle, false])) + _vehicleSeats;
        _vehicleSeats = (getNumber (configFile >> "CfgVehicles" >> typeof _vehicle >> "transportSoldier")) + _vehicleSeats;
        if (count (units _group) > _vehicleSeats) then {_canGetIn = false;};

        if (_canGetIn) then {_useVehicle = _vehicle;};
    } forEach _nearestVehicles;

    //Remove existing waypoints
    {deleteWaypoint [_group, 0];} foreach (waypoints _group);

    private _waypointCount = 0;
    private _waypoint = [];

    if (!isNull _useVehicle) then {
        _useVehicle setVariable [QGVAR(genSoldiers_usedByGroup), true];
        _waypoint = _group addWaypoint [position _useVehicle, 0, _waypointCount];
        _waypoint setWaypointType "GETIN";
        _waypoint setWaypointBehaviour "AWARE";
        _waypoint setWaypointCombatMode "RED";
        _waypoint setWaypointSpeed "FULL";
        _waypoint waypointAttachVehicle _useVehicle;
        _waypointCount = _waypointCount + 1;
    };
    _waypoint = _group addWaypoint [position _parentLogic, 0, _waypointCount];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "RED";
    _waypoint setWaypointSpeed "FULL";
    _waypoint setWaypointFormation _formation;
} forEach _childGroups;
