/*
 * Author: SzwedzikPL
 * Check conditions for simple GPS
 */

#include "\z\ace\addons\microdagr\functions\script_component.hpp"

private ["_mode", "_return", "_args", "_pfID", "_player"];

_mode = _this select 0;
_return = false;

//Check if can turn on
if(_mode == 0) then {
	_return = ("ACE_simpleGPS" in (items ACE_player)) && !(ACE_player getvariable [QGVAR(simpleTransmitting), false]) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)};
};
//Turn on
if(_mode == 1) then {
	ACE_player setvariable [QGVAR(simpleTransmitting), true, true];
    [{
        PARAMS_2(_args,_pfID);
        EXPLODE_1_PVT(_args,_player);
        if ((isNull ace_player) || {!alive ace_player} || {ace_player != _player} || {!("ACE_simpleGPS" in (items ACE_player))}) then {
            ACE_player setvariable [QGVAR(simpleTransmitting), false, true];
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.5, [ace_player]] call CBA_fnc_addPerFrameHandler;
    ["Nadajnik gps włączony"] call EFUNC(common,displayTextStructured);
	_return = true;
};
//Check if can turn off
if(_mode == 2) then {
	_return = ("ACE_simpleGPS" in (items ACE_player)) && (ACE_player getvariable [QGVAR(simpleTransmitting), false]) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)};
};
//Turn off
if(_mode == 3) then {
	ACE_player setvariable [QGVAR(simpleTransmitting), false, true];
    ["Nadajnik gps wyłączony"] call EFUNC(common,displayTextStructured);
	_return = true;
};

_return