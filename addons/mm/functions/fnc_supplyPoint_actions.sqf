/*
 * Author: SzwedzikPL
 * Supply point actions
 */
#include "script_component.hpp"

params ["_object", "_player", "_params"];
_params params ["_range", "_rearm", "_refuel", "_repair"];

private _vehicles = (nearestObjects [_object, ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship_F"], _range]) select {alive _x};
private _actions = [];

{
    private _vehicle = _x;
    private _displayName = getText (configFile >> "CfgVehicles" >> (typeof _vehicle) >> "displayName");
    private _actionID = format ["%1_%2", typeof _vehicle, _forEachIndex];

    private _supplyPointVehicleAction = [
        _actionID,
        _displayName,
        "",
        {},
        {!(_target getVariable [QGVAR(busy), false])},
        {},
        _object
    ] call ace_interact_menu_fnc_createAction;
    private _supplyPointVehicleActions = [];

    if (_rearm) then {
        private _rearmAction = [
            format ["%1_%2", _actionID, "rearm"],
            localize LSTRING(Module_SupplyPoint_Action_RearmVehicle_DisplayName),
            "",
            DFUNC(supplyPoint_rearmVehicle),
            {!((_this select 2) getVariable [QGVAR(busy), false])},
            {},
            _object
        ] call ace_interact_menu_fnc_createAction;
        _supplyPointVehicleActions pushBack [_rearmAction, [], _vehicle];
    };
    if (_refuel) then {
        private _refuelAction = [
            format ["%1_%2", _actionID, "refuel"],
            localize LSTRING(Module_SupplyPoint_Action_RefuelVehicle_DisplayName),
            "",
            DFUNC(supplyPoint_refuelVehicle),
            {!((_this select 2) getVariable [QGVAR(busy), false])},
            {},
            _object
        ] call ace_interact_menu_fnc_createAction;
        _supplyPointVehicleActions pushBack [_refuelAction, [], _vehicle];
    };
    if (_repair) then {
        private _repairAction = [
            format ["%1_%2", _actionID, "repair"],
            localize LSTRING(Module_SupplyPoint_Action_RepairVehicle_DisplayName),
            "",
            DFUNC(supplyPoint_repairVehicle),
            {!((_this select 2) getVariable [QGVAR(busy), false])},
            {},
            _object
        ] call ace_interact_menu_fnc_createAction;
        _supplyPointVehicleActions pushBack [_repairAction, [], _vehicle];
    };

    _actions pushBack [
        _supplyPointVehicleAction,
        _supplyPointVehicleActions,
        _vehicle
    ];

} forEach _vehicles;

_actions
