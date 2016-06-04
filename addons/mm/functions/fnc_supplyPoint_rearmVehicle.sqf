/*
 * Author: SzwedzikPL
 * Supply point rearm function
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];

private _isUAV = getNumber (configfile >> "CfgVehicles" >> (typeof _vehicle) >> "isUav") > 0;
if (!_isUAV && {count (crew _vehicle) > 0}) exitWith {
    [localize LSTRING(Module_SupplyPoint_VehicleMustBeEmpty), 2, _player] call ace_common_fnc_displayTextStructured;
};

[_vehicle, _player, _vehicle] call ace_rearm_fnc_rearmEntireVehicle;
