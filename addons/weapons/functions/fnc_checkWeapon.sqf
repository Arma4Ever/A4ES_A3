#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Check wepaon action
 */

params ["_player"];

if !([_player] call ace_reload_fnc_canCheckAmmoSelf) exitWith {};

private _weapon = currentWeapon _player;

if (_weapon == "" || {_weapon == secondaryWeapon _player}) exitWith {};

// Get adv ball setting
private _advBallEnabled = false;
if (_weapon == primaryWeapon _player) then {
  _advBallEnabled = _player getVariable [QGVAR(advBallEnabled), false];
};

// Get weapon temp
private _temperature = _unit getVariable [format ["ace_overheating_%1_temp", _weapon], 0];
private _scaledTemperature = (_temperature / 1000) min 1;

// Get magazine state
