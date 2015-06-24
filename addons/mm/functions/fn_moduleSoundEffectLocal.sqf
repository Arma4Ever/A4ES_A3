/*
	Author: SzwedzikPL

	Description:
	Create sound effect
*/

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(isDedicated) exitWith {};

if (_activated) then {
	_effectName = _logic getvariable ["effecttype",""];
	_effectLoop = _logic getvariable ["effectloop",false];
	_effectTime = getNumber (configFile >> "CfgSounds" >> _effectName >> "soundtime");

	_logic say3d _effectName;

	if(_effectLoop && _effectTime>0) then {
		[_logic, _effectName, _effectTime] spawn {
			while {true} do {
				sleep (_this select 2);
				(_this select 0) say3d (_this select 1);
			};
		};
	};
};

true