/*
 * Author: SzwedzikPL
 * Check vehicle doc
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\common\ui\idcListBox.hpp"

params ["_player"];

private _vehicle = vehicle _player;

while {dialog} do {closeDialog 0;};

private _dialog = createDialog "A3CS_ui_listBox";
if (!_dialog) exitWith {};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_ui_listBox", displayNull];
if (isNull _display) exitWith {};

private _vehicleCfg = (configFile >> "CfgVehicles" >> typeof _vehicle);
private _vehicleDisplayName = getText (_vehicleCfg >> "displayName");

private _fuelCargo = getNumber (_vehicleCfg >> "ace_refuel_fuelCargo");
private _cargoSpace = getNumber (_vehicleCfg >> "ace_cargo_space");

private _isMedicalVehicle = [_vehicle] call ace_repair_fnc_isRepairVehicle;
private _isRepairVehicle = [_vehicle] call ace_medical_fnc_isMedicalVehicle;

if (_isMedicalVehicle isEqualType 0) then {_isMedicalVehicle = _isMedicalVehicle > 0;};
if (_isRepairVehicle isEqualType 0) then {_isRepairVehicle = _isRepairVehicle > 0;};

//set header title
(_display displayCtrl IDC_LISTBOX_HEADER) ctrlSetText _vehicleDisplayName;
//setup close button
(_display displayCtrl IDC_LISTBOX_BUTTON3) ctrlSetText localize ELSTRING(Common,Close);
(_display displayCtrl IDC_LISTBOX_BUTTON3) buttonSetAction "closeDialog 0";
//hide 2 buttons
(_display displayCtrl IDC_LISTBOX_BUTTON1) ctrlShow false;
(_display displayCtrl IDC_LISTBOX_BUTTON2) ctrlShow false;

private _controlList = _display displayCtrl IDC_LISTBOX_LIST;
private _index = 0;

if (_cargoSpace > 0) then {
    _index = _controlList lbAdd format [localize LSTRING(CheckVehicleDoc_CargoSpace), _cargoSpace];
};
if (_isMedicalVehicle) then {_index = _controlList lbAdd format [localize LSTRING(CheckVehicleDoc_Prems), localize LSTRING(CheckVehicleDoc_MedicalVehicle)];};
if (_isRepairVehicle) then {_index = _controlList lbAdd format [localize LSTRING(CheckVehicleDoc_Prems), localize LSTRING(CheckVehicleDoc_RepairVehicle)];};
if (_fuelCargo > 0) then {
    _index = _controlList lbAdd format [localize LSTRING(CheckVehicleDoc_Prems), localize LSTRING(CheckVehicleDoc_RefuelVehicle)];
    _index = _controlList lbAdd format [localize LSTRING(CheckVehicleDoc_FuelCargo), format [localize LSTRING(CheckVehicleDoc_FuelCargoInfo), _fuelCargo]];
};
