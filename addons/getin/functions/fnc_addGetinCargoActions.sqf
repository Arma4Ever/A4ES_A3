/*
 * Author: SzwedzikPL
 *
 * Return children actions for getin cargo option
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_veh,_player,_parameters);
EXPLODE_3_PVT(_parameters,_vehicle);

private ["_actions", "_vehicleSlots", "_class", "_transportSoldier"];

_actions = [];
_vehicleSlots = [];
_class = typeOf _vehicle;
_transportSoldier = getNumber (configfile >> "CfgVehicles" >> _class >> "transportSoldier");

for [{_x=1},{_x<=_transportSoldier},{_x=_x+1}] do {

    _slotName = "cargo";
    _slotIndex = _x-1;
    _slotType = "cargo";

    _actionClass = format["a3cs_getin_cargo_%1%2", _slotName, _slotIndex];
    _actionName = "";
    _actionNameModifer = "";
    _actionCond = {true};

    if(_slotType == "cargo") then {
        _actionName = format ["Pasażer %1", _slotIndex];
        _isFree = [_vehicle, _slotIndex] call FUNC(checkCargoSlot);

        //Zajety?
        if(!(_isFree select 0)) then {
            _actionNameModifer = format [": %1", name (_isFree select 1)];
            _actionCond = {false};
        };
    };
    if(_actionName != "") then {
        _actionName = format["%1%2", _actionName, _actionNameModifer];
        _actions pushBack [
            [
                _actionClass,
                _actionName,
                "",
                {_this call FUNC(getIn)},
                _actionCond,
                {},
                [_vehicle, _slotType, _slotIndex],
                [0, 0, 0],
                13,
                [true, false, false, false]
            ],
            []
        ];
    };
} foreach _vehicleSlots;

_actions
