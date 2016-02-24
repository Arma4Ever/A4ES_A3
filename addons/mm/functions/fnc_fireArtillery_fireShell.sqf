/*
 * Author: SzwedzikPL
 * Fire shell if firing still active
 */
#include "script_component.hpp"

params ["_place"];

private _active = _place getVariable [QGVAR(fireArtillery_active), false];

//firing already expired
if(!_active) exitWith {};

private _placeSize = _place getVariable [QGVAR(fireArtillery_placeSize), 0];
private _ammo = _place getVariable [QGVAR(fireArtillery_ammo), "Sh_82mm_AMOS"];
private _timeCondition = _place getVariable [QGVAR(fireArtillery_timeCondition), 0];
private _countCondition = _place getVariable [QGVAR(fireArtillery_countCondition), 0];
private _codeCondition = _place getVariable [QGVAR(fireArtillery_codeCondition), {true}];
private _minDelay = _place getVariable [QGVAR(fireArtillery_minDelay), _minDelay];
private _maxDelay = _place getVariable [QGVAR(fireArtillery_maxDelay), _maxDelay];

private _startTime = _place getVariable [QGVAR(fireArtillery_startTime), 0];
private _shotsFired = _place getVariable [QGVAR(fireArtillery_shotsFired), 0];

//check time condition
if(_timeCondition > 0 && {(ACE_time - _startTime) >= _timeCondition}) then {_active = false;};
//check count condition
if(_countCondition > 0 && {_shotsFired >= _countCondition}) then {_active = false;};
//check expression condition
if(!(call _codeCondition)) then {_active = false};
//If firing no longer active set place as not active and log exit
if(!_active) exitWith {
    _place setVariable [QGVAR(genAttack_active), false, true];
    if(!isMultiplayer) then {systemchat "fireArtillery - Koniec ostrzalu";};
};

//Default shell params
private _shellPosition = [0,0,0];
private _shellAltitude = 500;
private _shellVelocity = [0, 0, -50];
private _goodPosition = false;
while {!_goodPosition} do {
    _goodPosition = true;
    _shellPosition = _place getPos [random _placeSize, random 360];
    if (!([_shellPosition, _place] call CBA_fnc_inArea)) then {_goodPosition = false;};
};

//Rocket parameters
private _hitPosition = +_shellPosition;
private _rocketClasses = ["missile_agm_01_f", "moduleordnancerocket_f_ammo"];
if((toLower _ammo) in _rocketClasses) then {
    private _shellDirection = getDir _place;
    _shellPosition = _shellPosition getPos [500, _shellDirection + 180];
    _shellAltitude = 1000 - ((getTerrainHeightASL _shellPosition) - (getTerrainHeightASL (position _place)));
    _shellVelocity = [sin _shellDirection * 68, cos _shellDirection * 68, -100];
};

//Correct shell altitude
_shellPosition set [2, _shellAltitude];

//Fire
private _shell = createVehicle [_ammo, _shellPosition, [], 0, "none"];
_shell setPos _shellPosition;
_shell setVelocity _shellVelocity;

_shotsFired = _shotsFired + 1;
_place setVariable [QGVAR(fireArtillery_shotsFired), _shotsFired];

if((toLower _ammo) == "missile_agm_01_f") then {
    [{_this setVectorUp [0, 0.902134, 0.430359]}, _shell, 0.02] call ace_common_fnc_waitAndExecute;
};

if(!isMultiplayer) then {
    private _marker = createMarkerLocal [str _shell, _hitPosition];
    _marker setMarkerTypeLocal "mil_circle";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerSizeLocal [0.5, 0.5];
};

//Send next fire mission
private _delay = [_minDelay, _maxDelay] call BIS_fnc_randomNum;
[DFUNC(fireArtillery_fireShell), _place, _delay] call ace_common_fnc_waitAndExecute;
