/*
	Autor: SzwedzikPL
	Opis: Generuje zrzut skrzyni ze sprzętem z samolotu
*/
#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	private ["_dropTarget","_side","_dropParams","_planeClass","_planeCfg"];

    _planeClass = _logic getvariable ["planeClass", ""];
    _dropTarget = call compile (_logic getVariable ["dropTarget", ""]);
    _side = call compile (_logic getVariable ["side", ""]);
    _items = call compile (_logic getVariable ["items", ""]);
    _dropHeight = _logic getvariable ["dropHeight",0];
    _dropChemlight = _logic getVariable ["dropChemlight", true];
    _planeFlares = _logic getVariable ["planeFlares", false];
    _dropParams = [_dropHeight, _dropChemlight, _planeFlares];

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

	_dis = 5000;
	_alt = if(typename (_dropParams select 0) == "SCALAR") then {_dropParams select 0} else {400};
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

		if(([position _plane select 0, position _plane select 1, 0] distance [_pos select 0,_pos select 1,0]) < 20 AND !_dropNull) then {

			//--- Drop supplies
			_dropNull = true;
			_drop = [_plane, _items, (_dropParams select 1)] spawn {
				private ["_plane","_items","_parachute","_box"];

				_plane = _this select 0;
				_items = _this select 1;
				_dropChem = _this select 2;

				if(!isMultiplayer) then {systemChat format ["Rozpoczynam zrzut: %1", typeof _plane];}; //--- Debug

				_parachute = createVehicle [['B_Parachute_02_F', 'O_Parachute_02_F', 'I_Parachute_02_F'] select ([WEST, EAST, RESISTANCE] find side group driver _plane), [100, 100, 200], [], 0, 'FLY'];
				_parachute setPos [position _plane select 0, position _plane select 1, (position _plane select 2) - 80];

				_box = createVehicle [['B_supplyCrate_F', 'O_supplyCrate_F', 'IG_supplyCrate_F'] select ([WEST, EAST, RESISTANCE] find side group driver _plane), position _parachute, [], 0, 'NONE'];

                clearBackpackCargoGlobal _box;
    			clearItemCargoGlobal _box;
    			clearMagazineCargoGlobal _box;
    			clearWeaponCargoGlobal _box;

                [_box, _items] call FUNC(addBoxItems);

				_box attachTo [_parachute, [0, 0, -0.41]];

				_null = [_parachute, _box, _dropChem] spawn {
					waitUntil {position (_this select 1) select 2 < 0.5 || isNull (_this select 0)};
					detach (_this select 1);
					(_this select 1) setPos [position (_this select 0) select 0, position (_this select 0) select 1, 0];
					sleep 1;
					//chemlight
					if((_this select 2)) then {
						_chemlightPos = [(_this select 1), 1, getDir (_this select 1)] call BIS_fnc_relPos;
						_chemlightPos set [2,((_chemlightPos select 2)+0.5)];
						_chemlight = createVehicle ['Chemlight_green', _chemlightPos, [], 0, 'NONE'];
						_chemlight setPos _chemlightPos;
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
		_flares = if(typename (_dropParams select 2) == "BOOL") then {_dropParams select 2} else {true};
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
