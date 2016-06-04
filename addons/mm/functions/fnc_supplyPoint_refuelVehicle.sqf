/*
 * Author: SzwedzikPL
 * Supply point refuel function
 */
#include "script_component.hpp"

params ["_vehicle", "_player", "_object"];

private _isUAV = getNumber (configfile >> "CfgVehicles" >> (typeof _vehicle) >> "isUav") > 0;
if (!_isUAV && {count (crew _vehicle) > 0}) exitWith {
    [localize LSTRING(Module_SupplyPoint_VehicleMustBeEmpty), 2, _player] call ace_common_fnc_displayTextStructured;
};

private _condition = {
    (_this select 0) params ["_vehicle", "_player"];
    count (crew _vehicle) == 0
};
if (_isUAV) then {_condition = {true};};

private _repairTime = (1-(fuel _vehicle)) * 60;
[_vehicle, "blockEngine", "A3CS_supplyPoint", true] call ace_common_fnc_statusEffect_set;

_object setVariable [QGVAR(busy), true, true];

[
    _repairTime,
    [_vehicle, _player, _object],
    {
        (_this select 0) params ["_vehicle", "_player", "_object"];
        [_vehicle, {_this setFuel 1}] remoteExecCall ["bis_fnc_call", _vehicle];
        [localize LSTRING(Module_SupplyPoint_Action_RefuelVehicle_Success), 2, _player] call ace_common_fnc_displayTextStructured;
        [_vehicle, "blockEngine", "A3CS_supplyPoint", false] call ace_common_fnc_statusEffect_set;
        _object setVariable [QGVAR(busy), false, true];
    },
    {
        (_this select 0) params ["_vehicle", "_player", "_object"];
        [localize LSTRING(Module_SupplyPoint_Action_RefuelVehicle_Fail), 2, _player] call ace_common_fnc_displayTextStructured;
        [_vehicle, "blockEngine", "A3CS_supplyPoint", false] call ace_common_fnc_statusEffect_set;
        _object setVariable [QGVAR(busy), false, true];
    },
    localize LSTRING(Module_SupplyPoint_Action_RefuelVehicle_Progress),
    _condition,
    ["isNotOnLadder"]
] call ace_common_fnc_progressBar;
