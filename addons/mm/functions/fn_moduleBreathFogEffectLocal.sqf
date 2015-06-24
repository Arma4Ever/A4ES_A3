/*
	Author: SzwedzikPL

	Description:
	Create breath fog effect on every unit
*/

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(isDedicated) exitWith {};

if (_activated) then {

	private ["_int","_nearunits"];

	_int = 0.02;
	while {alive player} do {
		_nearunits = nearestObjects [player, ["man"], 150];
		{
			private "_unit";
			_unit = _x;
			if(alive _unit && (vehicle _unit == _unit) && !(underwater _unit)) then {
				[_unit,_int] spawn {

					private ["_u","_i","_source","_fog"];

					sleep (2 + random 2);

					_u = _this select 0;
					_i = _this select 1;

					_source = "logic" createVehicleLocal (getpos _u);
					_fog = "#particlesource" createVehicleLocal getpos _source;
					_fog setParticleParams [
						["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],
						"",
						"Billboard",
						0.5,
						0.5,
						[0,0,0],
						[0, 0.2, -0.2],
						1, 1.275,	1, 0.2,
						[0, 0.2,0],
						[[1,1,1, _i], [1,1,1, 0.01], [1,1,1, 0]],
						[1000],
						1,
						0.04,
						"",
						"",
						_source
					];
					_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
					_fog setDropInterval 0.001;

					_source attachto [_u, [0, 0.15, 0], "neck"];

					sleep 0.5;

					deletevehicle _source;
					deletevehicle _fog;
				};
			};
		} foreach _nearunits;
		sleep 5;
	};
};

true