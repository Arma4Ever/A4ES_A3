/*
 * Author: SzwedzikPL
 * lanterns module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("lanterns: blokuje wykonanie modulu")true};

    private _place = call compile (_logic getVariable ["place", ""]);
    private _mode = _logic getVariable ["mode", "on"];

    //Calc size of place
    private _placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
    private _placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
    _placeSize = if (_placeShape == "ellipse") then {_placeSize + (_placeSize/5)} else {_placeSize + (_placeSize/2)};

    private _damage = [0.92, 0] select (["off", "on"] find _mode);

    private _lampClasses = [
        //arma 3
        "Lamps_Base_F",
        "PowerLines_base_F",
        "Land_PowerPoleWooden_F",
        "Land_PowerPoleWooden_L_F",
        "Land_PowerPoleWooden_small_F",
        "Land_LampAirport_F",
        "Land_LampDecor_F",
        "Land_LampHalogen_F",
        "Land_LampHarbour_F",
        "Land_LampShabby_F",
        "Land_LampSolar_F",
        "Land_LampStadium_F",
        "Land_LampStreet_F",
        "Land_LampStreet_small_F",
        //arma 2
        "StreetLamp",
        "Land_PowLines_WoodL",
        "Land_PowLines_ConcL",
        "Land_lampa_ind_zebr",
        "Land_lampa_sidl_3",
        "Land_lampa_vysoka",
        "Land_lampa_ind",
        "Land_lampa_ind_b",
        "Land_lampa_sidl",
        "Land_PowLines_Conc2L_EP1",
        "Land_Lamp_Street1_EP1",
        "Land_Lamp_Street2_EP1",
        "Land_Lamp_Small_EP1",
        "Land_Lampa_Ind_EP1"
    ];

    {
        if([_x, _place] call CBA_fnc_inArea) then {
            if(damage _x < 1) then {_x setDamage _damage;};
        };
    } forEach nearestObjects [_place, _lampClasses, _placeSize];

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
