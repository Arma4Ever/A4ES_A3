/*
 * Author: SzwedzikPL
 *
 * Return children actions for getin option
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_vehicle,_player,_parameters);

private ["_actions", "_vehicleSlots", "_move"];
_actions = [];
_move = if(vehicle ace_player != ace_player) then {true} else {false};

_vehicleSlots = [_vehicle] call FUNC(getVehicleSlots);

{
    _slotName = _x select 0;
    _slotIndex = _x select 1;
    _slotType = _x select 2;

    _actionClass = format["a3cs_getin_%1%2", _slotName, _slotIndex];
    _actionName = "";
    _actionNameModifer = "";
    _actionCond = {true};

    if(_slotType == "driver" || _slotType == "cargo") then {
         //Kierowca/Pilot
        if(_slotType == "driver") then {
            if(_vehicle iskindof "Air") then {
                _actionName = "Pilot";
                if(!([ace_player] call EFUNC(common,isPilot))) then {
                    _actionNameModifer = ": Brak uprawnień";
                    _actionCond = {false};
                };
            } else {
                _actionName = "Kierowca";
            };
            //Zajety?
            if(!isNull (driver _vehicle)) then {
                _actionNameModifer = format [": %1", name (driver _vehicle)];
                _actionCond = {false};
            };
        };
        //Pasazer
        if(_slotType == "cargo") then {};
     } else {
        //-- Proste tłumaczenia
        _slotNameArray = toArray _slotName;
        _slotNameFirstLetter = _slotNameArray deleteAt 0;
        _slotName = toupper(tostring [_slotNameFirstLetter]) + tolower(tostring _slotNameArray);

        _actionName = _slotName;
        if(_slotName == "Gunner") then {_actionName = "Strzelec";};
        if(_slotName == "Commander") then {_actionName = "Dowódca";};
        if(_slotName == "Left door gunner") then {_actionName = "Strzelec (lewe okno)";};
        if(_slotName == "Right door gunner") then {_actionName = "Strzelec (prawe okno)";};
        //-- Proste tłumaczenia

        if(_vehicle iskindof "Air" && (_slotName == "Drugi pilot" || _slotName == "Copilot")) then {
            if(!([ace_player] call EFUNC(common,isPilot))) then {
                _actionNameModifer = ": Brak uprawnień";
                _actionCond = {false};
            };
        };

        //Zajety?
        if(!isNull (_vehicle turretUnit _slotIndex)) then {
            _actionNameModifer = format [": %1", name (_vehicle turretUnit _slotIndex)];
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
                [_vehicle, _slotType, _slotIndex, _move],
                [0, 0, 0],
                13,
                [true, false, false, false],
                {}
            ],
            []
        ];
    };
} foreach _vehicleSlots;

//Cargo
if(getNumber (configfile >> "CfgVehicles" >> (typeof _vehicle) >> "transportSoldier")>0) then {
    _actions pushBack [
        [
            "a3cs_getin_cargoany",
            "Pasażer (dowolny)",
            "",
            {_this call FUNC(getIn)},
            {true},
            {},
            [_vehicle, "cargo", -1, _move],
            [0,0,0],
            13,
            [true,false,false,false],
            {}
        ],
        []
    ];
    /*
    _actions pushBack [
        [
            "a3cs_getin_cargolist",
            "Pasażer >>",
             "",
            {},
            {true},
            {_this call FUNC(addGetinCargoActions);},
            [_vehicle]
        ] call ace_interact_menu_fnc_createAction,
        [],
        _vehicle
    ];
    */
};

_actions