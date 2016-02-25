/*
 * Author: SzwedzikPL
 * Check conditions for simple GPS
 */

#include "\z\ace\addons\microdagr\functions\script_component.hpp"

params ["_mode"];
private _return = false;

//Check if can turn on
if(_mode == 0) then {
	_return = ("ACE_simpleGPS" in (items ACE_player)) && !(ACE_player getvariable [QGVAR(simpleTransmitting), false]) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)};
};
//Turn on
if(_mode == 1) then {
	ACE_player setvariable [QGVAR(simpleTransmitting), true, true];
    [{
        params ["_args", "_pfID"];
        _args params ["_player"];
        if ((isNull ace_player) || {!alive ace_player} || {ace_player != _player} || {!("ACE_simpleGPS" in (items ACE_player))}) then {
            ACE_player setvariable [QGVAR(simpleTransmitting), false, true];
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.5, [ace_player]] call CBA_fnc_addPerFrameHandler;
    [localize "STR_A3CS_Microdagr_TransmitterEnabled"] call EFUNC(common,displayTextStructured);
	_return = true;
};
//Check if can turn off
if(_mode == 2) then {
	_return = ("ACE_simpleGPS" in (items ACE_player)) && (ACE_player getvariable [QGVAR(simpleTransmitting), false]) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)};
};
//Turn off
if(_mode == 3) then {
	ACE_player setvariable [QGVAR(simpleTransmitting), false, true];
    [localize "STR_A3CS_Microdagr_TransmitterDisabled"] call EFUNC(common,displayTextStructured);
	_return = true;
};

_return
