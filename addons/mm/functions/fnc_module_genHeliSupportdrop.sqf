/*
	Autor: SzwedzikPL
	Opis: Generuje zrzut sprzętu z helikoptera za pomocą lin
*/
#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	private ["_dropTarget","_side","_heliClass","_heliCfg"];

    _dropTarget = _logic getvariable ["dropTarget",""];
    _heliClass = _logic getvariable ["heliClass",""];
    _side = call compile (_logic getVariable ["side", ""]);
    _cargoClass = call compile (_logic getVariable ["cargoClass", ""]);
    _dropDistance = _logic getvariable ["dropDistance",0];
    _dropHeight = _logic getvariable ["dropHeight",0];

    _dropParams = [_dropDistance, _dropHeight];

	if(typename _dropTarget == "OBJECT") then {if (isNull _dropTarget) exitwith {["Podany obszar nie istnieje"] call bis_fnc_error;};};
	if(typename _cargoClass == "STRING") then {if (_cargoClass == "") exitwith {["Podano nieprawidłowe cargo"] call bis_fnc_error;};};
	if(typename (_dropParams select 0) != "SCALAR" || typename (_dropParams select 1) != "SCALAR") exitwith {["Podano nieprawidłowe parametry zrzutu"] call bis_fnc_error;};

	_heliCfg = configfile >> "cfgvehicles" >> _heliClass;
	if !(isclass _heliCfg) exitwith {["Nieprawidlowa klasa helikoptera: %1",_heliClass] call bis_fnc_error;};

	//--- Generate pos
	private ["_dir","_posATL","_pos","_dis","_alt"];

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

	_dis = _dropParams select 0;
	_alt = _dropParams select 1;

	//--- Create heli
	private ["_heliPos","_heliArray","_heli"];

	_heliPos = [_pos,_dis,_dir + 180] call bis_fnc_relpos;
	_heliPos set [2,(_pos select 2) + _alt];
	_heliArray = [_heliPos,_dir,_heliClass,_side] call bis_fnc_spawnVehicle;
	_heli = _heliArray select 0;
	_heli setposasl _heliPos;

	//--- Create cargo
	_cargoPos = [_heliPos select 0,_heliPos select 1,((_heliPos select 2)-10)];
	_cargoItems = [];
	if(typename _cargoClass == "ARRAY") then {
		_cargoItems = _cargoClass;
		_cargoClass = ['B_CargoNet_01_ammo_F', 'O_CargoNet_01_ammo_F', 'I_CargoNet_01_ammo_F'] select ([WEST, EAST, RESISTANCE] find side group driver _heli);
	};

	_cargo = createVehicle [_cargoClass, _cargoPos, [], 0, 'NONE'];
	if(count _cargoItems > 0) then {
		clearBackpackCargoGlobal _cargo;
		clearItemCargoGlobal _cargo;
		clearMagazineCargoGlobal _cargo;
		clearWeaponCargoGlobal _cargo;
		[_cargo, _cargoItems] call FUNC(addBoxItems);
	};


	//--- Attach cargo
	if(!(_heli canSlingLoad _cargo)) exitwith {
		deleteVehicle _cargo;
		deleteVehicle _heli;
		["Podany ladunek nie moze byc przewozony przez ten pojazd"] call bis_fnc_error;
	};
	_heli setSlingLoad _cargo;

	//--- Waypoint
	_pos set [2,0];
	_wp = (group _heli) addWaypoint [_pos, 0];
	_wp setWaypointType "UNHOOK";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointSpeed "NORMAL";
	(group _heli) setCurrentWaypoint _wp;
	_heli flyinheight _alt;

	//--- Debug
	if(!isMultiplayer) then {
		private "_marker";
		_marker = createMarkerLocal ["marker"+(str _heli), _pos];
		_marker setMarkerTypeLocal "mil_end";
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerSizeLocal [0.5, 0.5];
		systemChat format ["Rozpoczynam podejście: %1", _heliClass];
		_heli spawn {
			private "_marker";
			_marker = createMarkerLocal ["marker01"+(str _this), getPos _this];
			_marker setMarkerTypeLocal "c_air";
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

	//--- Wait until drop
	waituntil {sleep 0.5;((((getposATL _cargo) select 2) < 0.5) AND (speed _heli)<1 AND (speed _heli)>(-1)) || !alive _heli || isNull getSlingLoad _heli};

	//--- Drop
	if(alive _heli) then {
		if(!isMultiplayer) then {systemChat format ["Zrzucam ładunek: %1", _heliClass];}; //--- Debug
		{_cargo ropeDetach _x} foreach ropes _heli;
		_heli flyinheight _alt;
		[_heli,_dir,_dis] spawn {
			_heli = _this select 0;
			_dir = _this select 1;
			_dis = _this select 2;
			sleep 5;
			if(!isMultiplayer) then {systemChat format ["Wracam do bazy: %1", typeof _heli];}; //--- Debug
			{deleteWaypoint _x;} foreach waypoints _heli;
			_newHeliPos = [position _heli,(_dis*2),_dir + 180] call bis_fnc_relpos;
			_wp = (group _heli) addWaypoint [_newHeliPos, 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointSpeed "FULL";
			(group _heli) setCurrentWaypoint _wp;
		};
	};

	waituntil {_heli distance _pos > _dis || !alive _heli};

	//--- Delete heli
	if (alive _heli) then {
		private ["_group","_crew"];
		_group = group _heli;
		_crew = crew _heli;
		deletevehicle _heli;
		{deletevehicle _x} foreach _crew;
		deletegroup _group;
		if(!isMultiplayer) then {systemChat format ["Koniec lotu: %1", _heliClass];}; //--- Debug
	};
};
