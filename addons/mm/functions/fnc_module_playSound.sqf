#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!isServer) exitWith {};
if(!_activated) exitWith {};

private ["_object","_sound","_soundFromMS","_isInside","_volume","_distance","_path"];

_object = call compile (_logic getVariable ["object", ""]);
_sound = _logic getVariable ["sound", ""];
_soundFromMS = _logic getVariable ["soundFromMS", true];
_isInside = _logic getVariable ["isInside", false];
_volume = _logic getVariable ["volume", 10];
_distance = _logic getVariable ["distance", 50];

_path = "";

if(_soundFromMS) then {
    _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
};

playSound3D [format ["%1%2", _path, _sound], _object, _isInside, getPos _object, _volume, 1, _distance];
