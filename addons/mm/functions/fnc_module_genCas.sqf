/*
	Autor: SzwedzikPL
	Opis: Generuje nalot lotniczy
*/
#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	private ["_casTarget","_planeClass","_weaponTypesID","_weaponIndex","_planeCfg","_weaponTypes","_weapons","_wepindex"];

    _casTarget = _logic getvariable ["casTarget",""];
    _planeClass = _logic getvariable ["planeClass",""];
    _weaponTypesID = _logic getvariable ["weaponTypesID",0];
    _weaponIndex = _logic getvariable ["weaponIndex",0];

	if(_casTarget == "") exitwith {["Podany obszar nie istnieje"] call bis_fnc_error;};

	_planeCfg = (configfile >> "cfgvehicles" >> _planeClass);
	if (!isclass _planeCfg) exitwith {["Nieprawidlowa klasa samolotu: %1", _planeClass] call bis_fnc_error;};

	//--- Detect gun
	_weaponTypes = switch _weaponTypesID do {
		case 0: {["machinegun"]};
		case 1: {["missilelauncher"]};
		case 2: {["machinegun","missilelauncher"]};
		case 3: {["bomblauncher"]};
		case 4: {["bomblauncher"]};
		default {[]};
	};
	_weapons = [];
	_wepindex = 0;
	{
		if ((tolower ((_x call bis_fnc_itemType) select 1) in _weaponTypes)) then {
			_modes = getarray (configfile >> "cfgweapons" >> _x >> "modes");
			if (count _modes > 0) then {
				if((((_weaponTypesID == 3 OR _weaponTypesID == 4) AND count _weapons == 0) OR _weaponTypesID != 3) AND (_wepindex == _weaponIndex OR _weaponTypesID == 2)) then {
					_mode = _modes select 0;
					if (_mode == "this") then {_mode = _x;};
					_weapons set [count _weapons,[_x,_mode]];
				};
				_wepindex = _wepindex+1;
			};
		};
	} foreach getarray (_planeCfg >> "weapons");


	if (count _weapons == 0) exitwith {["Brak wskazanego uzbrojenia w samolotcie %1",_planeClass] call bis_fnc_error; false};

	//--- Generate pos
	private ["_dir","_posATL","_pos","_dis","_alt","_pitch","_speed","_duration"];

	_posATL = getMarkerPos _casTarget;
	_dir = markerDir _casTarget;

	_pos = +_posATL;
	_pos set [2,(_pos select 2) + getterrainheightasl _pos];

	_dis = 3000;
	_alt = 1000;
	_pitch = atan (_alt / _dis);
	_speed = 400 / 3.6;
	_duration = ([0,0] distance [_dis,_alt]) / _speed;

	//--- Create plane
	private ["_planePos","_planeSide","_planeArray","_plane","_vectorDir","_velocity","_vectorUp","_currentWeapons"];

	_planePos = [_pos,_dis,_dir + 180] call bis_fnc_relpos;
	_planePos set [2,(_pos select 2) + _alt];
	_planeSide = (getnumber (_planeCfg >> "side")) call bis_fnc_sideType;
	_planeArray = [_planePos,_dir,_planeClass,_planeSide] call bis_fnc_spawnVehicle;
	_plane = _planeArray select 0;
	_plane setposasl _planePos;
	_plane move ([_pos,_dis,_dir] call bis_fnc_relpos);
	_plane disableai "move";
	_plane disableai "target";
	_plane disableai "autotarget";
	_plane setcombatmode "blue";

	_vectorDir = [_planePos,_pos] call bis_fnc_vectorFromXtoY;
	_velocity = [_vectorDir,_speed] call bis_fnc_vectorMultiply;
	_plane setvectordir _vectorDir;
	[_plane,-90 + atan (_dis / _alt),0] call bis_fnc_setpitchbank;
	_vectorUp = vectorup _plane;

	//--- Remove all other weapons
	_currentWeapons = weapons _plane;
	{
		if (!(tolower ((_x call bis_fnc_itemType) select 1) in (_weaponTypes + ["countermeasureslauncher"]))) then {
			_plane removeweapon _x;
		};
	} foreach _currentWeapons;

	//--- Debug
	if(!isMultiplayer) then {
		private "_marker";
		_marker = createMarkerLocal ["marker"+(str _plane), _pos];
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerSizeLocal [0.5, 0.5];
		systemChat format ["Rozpoczynam nalot: %1", _planeClass];
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

	//--- Approach
	private ["_fire","_fireNull","_time","_offset","_fireProgress"];

	_fire = [] spawn {waituntil {false}};
	_fireNull = true;
	_time = time;
	_offset = if ({_x == "missilelauncher"} count _weaponTypes > 0) then {20} else {0};
	_offset = if ({_x == "bomblauncher"} count _weaponTypes > 0) then {185} else {_offset};
	_offset = if (({_x == "bomblauncher"} count _weaponTypes > 0) AND (_planeClass in ["IVORY_MIG29","su34_PL","su34"])) then {405} else {_offset}; //PAM
	_offset = if (({_x == "bomblauncher"} count _weaponTypes > 0) AND (_planeClass in ["LIB_P47","LIB_Ju87","LIB_FW190F8","LIB_P39","LIB_Pe2"])) then {325} else {_offset}; //IF

	if(_weaponTypesID == 4) then {_offset = _offset+5;};

	waituntil {
		_fireProgress = _plane getvariable ["fireProgress",0];

		//--- Set the plane approach vector
		_plane setVelocityTransformation [
			_planePos, [_pos select 0,_pos select 1,(_pos select 2) + _offset + _fireProgress * 12],
			_velocity, _velocity,
			_vectorDir,_vectorDir,
			_vectorUp, _vectorUp,
			(time - _time) / _duration
		];
		_plane setvelocity velocity _plane;

		//--- Fire!
		if ((getposasl _plane) distance _pos < 1000 && _fireNull) then {
			_fireNull = false;
			terminate _fire;
			_fire = [_plane,_weapons,_weaponTypes,_weaponTypesID] spawn {
				private ["_plane","_planeDriver","_weapons","_weaponTypes","_weaponTypesID","_duration","_time","_sleepTime","_shotlimit","_shots"];

				_plane = _this select 0;
				_planeDriver = driver _plane;
				_weapons = _this select 1;
				_weaponTypes = _this select 2;
				_weaponTypesID = _this select 3;
				_duration = 3;
				_time = time + _duration;
				_sleepTime = if ({_x == "bomblauncher"} count _weaponTypes > 0) then {0.2} else {0.1};
				_shotlimit = if (_weaponTypesID == 4) then {1} else {99999};
				_shots = 0;

				if(!isMultiplayer) then {systemChat format ["Atakuję: %1", typeof _plane];}; //--- Debug

				waituntil {
					{
						if(_shots < _shotlimit) then {
							_planeDriver forceweaponfire _x;
							_shots = _shots+1;
						};
					} foreach _weapons;
					_plane setvariable ["fireProgress",(1 - ((_time - time) / _duration)) max 0 min 1];
					sleep _sleepTime;
					time > _time || !alive _plane
				};
				sleep 1;
			};
		};

		sleep 0.01;
		scriptdone _fire || !alive _plane
	};
	_plane setvelocity velocity _plane;
	_plane flyinheight _alt;
	sleep 1;

	if(alive _plane) then {

		//--- FLARY NA ODEJSCIU
		_plane spawn {
			for "_x" from 1 to 10 do {
				if(!alive _this) exitWith {};
			 	driver _this forceweaponfire ["CMFlareLauncher","Single"];
			 	sleep 3;
			};
		};

		if(!isMultiplayer) then {
            systemChat format ["Wracam do bazy: %1", _planeClass];
        }; //--- Debug

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

		if(!isMultiplayer) then {
            systemChat format ["Koniec lotu: %1", _planeClass];
        }; //--- Debug
	};
};
