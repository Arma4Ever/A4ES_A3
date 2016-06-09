/*
 * Author: SzwedzikPL
 * Fire shell if firing still active
 */
#include "script_component.hpp"

params ["_logic"];

private _active = _logic getVariable [QGVAR(fireArtillery_active), false];

//firing already expired
if (!_active) exitWith {};

private _logicAreaParams = _logic getvariable "objectArea";
private _ammo = _logic getVariable ["ammo", "Sh_82mm_AMOS"];
private _timeCondition = _logic getVariable ["timeCondition", 0];
private _countCondition = _logic getVariable ["countCondition", 0];
private _codeCondition = compile (_logic getVariable ["codeCondition", "true"]);
private _minDelay = _logic getVariable ["minDelay", 0];
private _maxDelay = _logic getVariable ["maxDelay", 0];

private _startTime = _logic getVariable [QGVAR(fireArtillery_startTime), 0];
private _shotsFired = _logic getVariable [QGVAR(fireArtillery_shotsFired), 0];

//check time condition
if (_timeCondition > 0 && {(CBA_missionTime - _startTime) >= _timeCondition}) then {_active = false;};
//check count condition
if (_countCondition > 0 && {_shotsFired >= _countCondition}) then {_active = false;};
//check expression condition
if (!(call _codeCondition)) then {_active = false};
//If firing no longer active set logic as not active and log exit
if (!_active) exitWith {
    _logic setVariable [QGVAR(genAttack_active), false, true];
    if (!isMultiplayer) then {systemchat "fireArtillery - Koniec ostrzalu";};
};

//Calc size of logic
_logicAreaParams params ["_logicSizeX","_logicSizeY", "_logicAngle", "_logicIsRectangle"];
private _logicArea = [_logic, _logicSizeX, _logicSizeY, _logicAngle, _logicIsRectangle];
private _logicSize = _logicSizeX max _logicSizeY;

//Default shell params
private _shellPosition = [0,0,0];
private _shellAltitude = 500;
private _shellVelocity = [0, 0, -50];
private _goodPosition = false;
while {!_goodPosition} do {
    _goodPosition = true;
    _shellPosition = _logic getPos [random _logicSize, random 360];
    if (!(_shellPosition inArea _logicArea)) then {_goodPosition = false;};
};

//Rocket parameters
private _hitPosition = +_shellPosition;
private _rocketClasses = ["missile_agm_01_f", "moduleordnancerocket_f_ammo"];
if ((toLower _ammo) in _rocketClasses) then {
    private _shellDirection = getDir _logic;
    _shellPosition = _shellPosition getPos [500, _shellDirection + 180];
    _shellAltitude = 1000 - ((getTerrainHeightASL _shellPosition) - (getTerrainHeightASL (position _logic)));
    _shellVelocity = [sin _shellDirection * 68, cos _shellDirection * 68, -100];
};

//Correct shell altitude
_shellPosition set [2, _shellAltitude];

//Fire
private _shell = createVehicle [_ammo, _shellPosition, [], 0, "none"];
_shell setPos _shellPosition;
_shell setVelocity _shellVelocity;

_shotsFired = _shotsFired + 1;
_logic setVariable [QGVAR(fireArtillery_shotsFired), _shotsFired];

if ((toLower _ammo) == "missile_agm_01_f") then {
    [{_this setVectorUp [0, 0.902134, 0.430359]}, _shell, 0.02] call CBA_fnc_waitAndExecute;
};

if (!isMultiplayer) then {
    private _marker = createMarkerLocal [str _shell, _hitPosition];
    _marker setMarkerTypeLocal "mil_circle";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerSizeLocal [0.5, 0.5];
};

//Send next fire mission
private _delay = [_minDelay, _maxDelay] call BIS_fnc_randomNum;
[DFUNC(fireArtillery_fireShell), _logic, _delay] call CBA_fnc_waitAndExecute;
