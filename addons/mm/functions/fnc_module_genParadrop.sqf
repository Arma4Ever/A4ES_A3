#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	private ["_dropTarget","_amount","_side","_classes","_skillType","_script","_jumpParams","_nextTarget","_planeClass","_planeCfg"];

    _planeClass = _logic getvariable ["planeClass", ""];
    _dropTarget = call compile (_logic getVariable ["dropTarget", ""]);
    _amount = _logic getvariable ["amount",0];
    _side = call compile (_logic getVariable ["side", ""]);
    _classes = call compile (_logic getVariable ["classes", ""]);
    _skillType = 0;
    _script = compile (_logic getVariable ["script", ""]);
    _jumpHeight = _logic getvariable ["jumpHeight",0];
    _openHeight = _logic getvariable ["openHeight",0];
    _planeFlares = _logic getvariable ["planeFlares", true];
    _jumpParams = [_jumpHeight,_openHeight,_planeFlares];
    _nextTarget = call compile (_logic getVariable ["nextTarget", ""]);

	if(typename _dropTarget == "OBJECT") then {if (isNull _dropTarget) exitwith {["Podany obszar nie istnieje"] call bis_fnc_error;};};

	_planeCfg = configfile >> "cfgvehicles" >> _planeClass;
	if !(isclass _planeCfg) exitwith {["Nieprawidlowa klasa samolotu: %1",_planeClass] call bis_fnc_error;};

	//--- Generate pos
	private ["_dir","_posATL","_pos","_dis","_alt","_speed","_duration"];

	_dir = 0;
	_posATL = [];

	switch (typename _dropTarget) do {
		case "STRING" : {
			_posATL = getMarkerPos _dropTarget;
			_dir = markerDir _dropTarget;
		};
		case "OBJECT" : {
			private ["_objSize","_objPos","_objPosT","_rightPos"];

			_objSize = ((triggerArea _dropTarget) select 0) max ((triggerArea _dropTarget) select 1);
			_objSize = if ((triggerArea _dropTarget) select 3) then {_objSize + (_objSize/2)} else {_objSize + (_objSize/5)};
			_objPos = getposatl _dropTarget;
			_objPosT = [];
			_rightPos = false;

			waitUntil {
				_posATL = [_objPos, random _objSize, random 360] call BIS_fnc_relPos;
				if ([_posATL, _dropTarget] call CBA_fnc_inArea) then {_rightPos = true;};
				_rightPos
			};
			_dir = getDir _dropTarget;
		};
	};

	_pos = +_posATL;
	_pos set [2,(_pos select 2) + getterrainheightasl _pos];

	_dis = 3000;
	_alt = if(typename (_jumpParams select 0) == "SCALAR") then {_jumpParams select 0} else {600};
	_speed = 320 / 3.6;
	_duration = ([0,0] distance [_dis,_alt]) / _speed;

	//--- Create plane
	private ["_planePos","_planeArray","_plane","_vectorDir","_velocity","_vectorUp"];

	_planePos = [_pos,_dis,_dir + 180] call bis_fnc_relpos;
	_planePos set [2,(_pos select 2) + _alt];
	_planeArray = [_planePos,_dir,_planeClass,_side] call bis_fnc_spawnVehicle;
	_plane = _planeArray select 0;
	_plane setposasl _planePos;
	_plane move ([_pos,_dis,_dir] call bis_fnc_relpos);
	_plane disableai "move";
	_plane disableai "target";
	_plane disableai "autotarget";
	_plane setcombatmode "blue";

	_vectorDir = [_planePos,_pos] call bis_fnc_vectorFromXtoY;
	_vectorUp = [0,0,1];
	_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
	_plane setvectordir _vectorDir;
	_plane setVectorUp _vectorUp;
	[_plane,-90 + atan (_dis / _alt),0] call bis_fnc_setpitchbank;

	//--- Debug
	if(!isMultiplayer) then {
		private "_marker";
		_marker = createMarkerLocal ["marker"+(str _plane), _pos];
		_marker setMarkerTypeLocal "mil_end";
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerSizeLocal [0.5, 0.5];
		systemChat format ["Rozpoczynam podejście: %1", _planeClass];
		_plane spawn {
			private "_marker";
			_marker = createMarkerLocal ["marker01"+(str _this), getPos _this];
			_marker setMarkerTypeLocal "c_plane";
			_marker setMarkerColorLocal "Color"+(str side _this);
			_marker setMarkerSizeLocal [0.8, 0.8];
			while {alive _this} do {
				_marker setMarkerDirLocal (getDir _this);
				_marker setMarkerPosLocal (getPos _this);
				sleep 0.1;
			};
			deleteMarkerLocal _marker;
		};
	};

	//--- Drop
	private ["_drop","_dropNull","_time"];

	_drop = [] spawn {waituntil {false}};
	_dropNull = false;
	_time = time;

	_pos = [_planePos,_dis,_dir] call bis_fnc_relpos; //pos height fix

	waituntil {
		//--- Set the plane approach vector
		_plane setVelocityTransformation [
			_planePos, [_pos select 0,_pos select 1,_pos select 2],
			_velocity, _velocity,
			_vectorDir,_vectorDir,
			_vectorUp, _vectorUp,
			(time - _time) / _duration
		];
		_plane setvelocity _velocity;
		_plane setVectorUp _vectorUp;

		if(([position _plane select 0, position _plane select 1, 0] distance [_pos select 0,_pos select 1,0]) < 100 AND !_dropNull) then {

			//--- Drop units
			_dropNull = true;
			_drop = [_plane,_amount,_side,_classes,_skillType,_script,_nextTarget, _jumpParams, _pos] spawn {
				private ["_plane","_amount","_side","_classes","_skillType","_script","_nextTarget","_group","_soldiers","_class","_soldierPos","_soldier","_openH","_lz"];
				_plane = _this select 0;
				_amount = _this select 1;
				_side = _this select 2;
				_classes = _this select 3;
				_skillType = _this select 4;
				_script = _this select 5;
				_nextTarget = _this select 6;
				_openH = (_this select 7) select 1;
				_lz = _this select 8;

				if(!isMultiplayer) then {systemChat format ["Rozpoczynam zrzut: %1", typeof _plane];}; //--- Debug

				_group = createGroup _side;
				_soldiers = [];

				for [{_x=1},{_x<=_amount},{_x=_x+1}] do {
					_class = _classes call BIS_fnc_selectRandom;
					_soldierPos = getPosasl _plane;
					sleep 0.35;
					_soldier = _group createUnit [_class, _soldierPos, [], 0, "NONE"];
					[_soldier] join _group;
					//[_soldier,_skillType] call A3C_sys_fnc_setSkill;
					_soldiers pushBack _soldier;
					_soldier spawn _script;
					[_soldier,_openH] spawn {
						private ["_soldier","_openH","_soldierPos","_soldierVelocity","_parachute"];
						_soldier = _this select 0;
						_openH = _this select 1;
						waitUntil {((getPosATL _soldier) select 2) < _openH};
						_soldierPos = getPosASL _soldier;
						_soldierVelocity = velocity _soldier;
						_parachute = createVehicle ["Steerable_Parachute_F", _soldierPos, [], 0, "NONE"];
						_soldier moveInDriver _parachute;
						_parachute setPosASL _soldierPos;
						_parachute setdir random 360;
						_parachute setVelocity _soldierVelocity;

						if(!isMultiplayer) then {
							private "_marker";
							_marker = createMarkerLocal [str(_soldier), position _soldier];
							_marker setMarkerTypeLocal "o_inf";
							_marker setMarkerColorLocal "Color"+(str side _soldier);
							_marker setMarkerSizeLocal [0.8, 0.8];
							while{alive _soldier} do {
								sleep 0.5;
								_marker setMarkerDirLocal (getDir vehicle _soldier);
								_marker setMarkerPosLocal (position vehicle _soldier);
							};
						};
					};
				};

				//--- Set waypoint when group land
				_lz set [2,0];
				[_group,_soldiers,_lz,_nextTarget] spawn {
					private ["_group","_soldiers","_lz","_nextTarget","_gonext","_wp"];
					_group = _this select 0;
					_soldiers = _this select 1;
					_lz = _this select 2;
					_nextTarget = _this select 3;

					//--- Wait until all open parachutes
					_gonext = false;
					waituntil {
						sleep 0.5;
						_gonext = true;
						{if(vehicle _x == _x) then {_gonext = false;}} forEach _soldiers;
						_gonext
					};

					//--- Wait until all land
					_gonext = false;
					waituntil {
						sleep 0.5;
						_gonext = true;
						{if(vehicle _x != _x) then {_gonext = false;}} forEach _soldiers;
						_gonext
					};

					//--- Add waypoints to group
					sleep 1;
					{deleteWaypoint _x;} forEach (waypoints _group);

					if(_nextTarget != "") then {
						_wp = _group addwaypoint [getMarkerPos _nextTarget,20,0];
						_wp setWaypointType "MOVE";
						_wp setWaypointBehaviour "AWARE";
						_wp setWaypointCombatMode "RED";
						_wp setWaypointSpeed "FULL";
					};
				};
			};
		};

		sleep 0.01;
		scriptdone _drop || !alive _plane
	};

	_plane setvelocity _velocity;
	_plane flyinheight _alt;
	sleep 1;

	if(alive _plane) then {
		private "_flares";
		_flares = if(typename (_jumpParams select 2) == "BOOL") then {_jumpParams select 2} else {true};
		if(_flares) then {
			//--- FLARY NA ODEJSCIU
			_plane spawn {
				for "_x" from 1 to 20 do {
					if(!alive _this) exitWith {};
				 	driver _this forceweaponfire ["CMFlareLauncher","Single"];
				 	sleep 1.5;
				};
			};
		};
		if(!isMultiplayer) then {systemChat format ["Wracam do bazy: %1", _planeClass];}; //--- Debug
	};

	waituntil {_plane distance _pos > _dis || !alive _plane};

	//--- Delete plane
	if (alive _plane) then {
		private ["_group","_crew"];
		_group = group _plane;
		_crew = crew _plane;
		deletevehicle _plane;
		{deletevehicle _x} foreach _crew;
		deletegroup _group;
		if(!isMultiplayer) then {systemChat format ["Koniec lotu: %1", _planeClass];}; //--- Debug
	};
};
