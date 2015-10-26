#include "script_component.hpp"
_this spawn {
	private ["_place","_distance","_ammount","_side","_classes","_script","_ignore","_distance_land","_distance_air","_placePos","_debug","_placeShape","_placeSize","_placeSize","_groupCount","_groupCountType","_groupCountTypeMin","_groupCountTypeMax","_lastgroup"];

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!isServer) exitWith {};
    if(!_activated) exitWith {};

    //------------------------------------------------------------
    _place = call compile (_logic getVariable ["place", ""]);
    _distanceLand = _logic getvariable ["distanceLand",0];
    _distanceAir = _logic getvariable ["distanceAir",0];
    _distance = [_distanceLand, _distanceAir];
    _ammount = _logic getvariable ["ammount",0];
    _side = call compile (_logic getVariable ["side", ""]);
    _classes = call compile (_logic getVariable ["classes", ""]);
    _groupCount = call compile (_logic getVariable ["groupCount", ""]);
    _script = compile (_logic getVariable ["script", ""]);
    _ignore = call compile (_logic getVariable ["ignore", ""]);

    if(isNil "_ignore") then {_ignore = [];};
    if(typename _ignore != typename []) then {_ignore = [];};

    if(isNil "_groupCount") then {_groupCount = 1;};
    if(typename _groupCount != typename 0) then {_groupCount = 1;};

	//------------------------------------------------------------
	_distance_land = _distance select 0;
	_distance_air = _distance select 1;
	_placePos = getPos _place;
	_debug = if(isMultiplayer) then {false} else {true};
	_place setVariable ["a3c_gen_soldiers", _ammount, true];
	_placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
	_placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
	_placeSize = switch (_placeShape) do {case "ellipse": {_placeSize + (_placeSize/5)};case "rectangle": {_placeSize + (_placeSize/2)};};
	_groupCountType = 0;
	_groupCountTypeMin = 0;
	_groupCountTypeMax = 0;
	switch (typename _groupCount) do {
		case "SCALAR" : {_groupCountType = 1;	};
		case "ARRAY" : {
			_groupCountType = 2;
			_groupCountTypeMin = (_groupCount select 0) min (_groupCount select 1);
			_groupCountTypeMax = (_groupCount select 0) max (_groupCount select 1);
		};
	};
	//------------------------------------------------------------
	while {(_place getVariable ["a3c_gen_soldiers",0]) > 0} do {
		waitUntil {
			sleep 4;
			_gen = false;
			_players = call CBA_fnc_players;
			_nearestPlayer = [_placePos, _players, (_distance_land max _distance_air)] call CBA_fnc_getNearest;
			if((count _nearestPlayer) > 0) then {
				if(_distance_land > 0) then {
					_nearestLand = [_placePos, _players, _distance_land] call CBA_fnc_getNearest;
					if((count _nearestLand) > 0) then {
						_unit = vehicle (_nearestLand select 0);
						if(!(_unit isKindOf "Air")) then {_gen = true;};
					};
				};
				if(_distance_air > 0) then {
					_nearestAir = [_placePos, _players, _distance_air] call CBA_fnc_getNearest;
					if((count _nearestAir) > 0) then {
						_unit = vehicle (_nearestAir select 0);
						if(_unit isKindOf "Air") then {_gen = true;};
					};
				};
			};
			_gen
		};
		if(_debug) then {systemchat ("generuje zolnierzy");};
		_ammount = _place getVariable ["a3c_gen_soldiers",0];
		_soldiers = [];
		_waypoints = [];
		_lastgroup = objNull;
		for [{_x=1},{_x<=_ammount},{_x=_x+1}] do {
			_soldierWaypoints = [];
			_soldierPos = [];
			//---------- PICK POSITION
			waitUntil {
				_havePos = true;
				_soldierPos = [_placePos, _placeSize] call CBA_fnc_randPos;
				if (!([_soldierPos, _place] call CBA_fnc_inArea)) then {_havePos = false;};
				{if([_soldierPos, _x] call CBA_fnc_inArea) then {_havePos = false;};} forEach _ignore;
				_havePos
			};
			//---------- CREATE SOLDIER
			_class = _classes call BIS_fnc_selectRandom;
			_group = objNull;
			//- GROUP JOIN
			if(isNull _lastgroup) then {
				_group = createGroup _side;
				_lastgroup = _group;
				if(_groupCountType == 2) then {
					_groupCount = _groupCountTypeMin + round (random (_groupCountTypeMax-_groupCountTypeMin));
				};
			} else {
				if(_groupCountType == 1) then {
					if((count (units _lastgroup))<_groupCount) then {
						_group = _lastgroup;
						_soldierPos = getPos ((units _lastgroup) select 0);
					} else {
						_group = createGroup _side;
						_lastgroup = _group;
					};
				};
				if(_groupCountType == 2) then {
					if((count (units _lastgroup))<_groupCount) then {
						_group = _lastgroup;
						_soldierPos = getPos ((units _lastgroup) select 0);
					} else {
						_group = createGroup _side;
						_lastgroup = _group;
						_groupCount = _groupCountTypeMin + round (random (_groupCountTypeMax-_groupCountTypeMin));
					};
				};
			};

			_soldier = _group createUnit [_class, _soldierPos, [], 0, "NONE"];
			[_soldier] join _group;
			_soldier spawn _script;
			_soldier allowFleeing 0;
			_soldiers set [count _soldiers, _soldier];
			//---------- WAYPOINTS
			if((count (units _group))==1) then {
				_type = "MOVE";
				_behaviour = "SAFE";
				_mode = "RED";
				_speed = "LIMITED";
				_wpammount = 3;
				for [{_y=1},{_y<=_wpammount},{_y=_y+1}] do {
					_genPos = [];
					waitUntil {
						_havePos = true;
						_genPos = [_placePos, _placeSize] call CBA_fnc_randPos;
						if (!([_genPos, _place] call CBA_fnc_inArea)) then {_havePos = false;};
						{if([_genPos, _x] call CBA_fnc_inArea) then {_havePos = false;};} forEach _ignore;
						_havePos
					};
					_wp = _group addwaypoint [_genPos,2];
					_wp setWaypointType (if (_y < _wpammount) then {_type} else {"CYCLE"});
					_wp setWaypointBehaviour _behaviour;
					_wp setWaypointCombatMode _mode;
					_wp setWaypointSpeed _speed;
					_waypoints set [count _waypoints, _wp];
					_soldierWaypoints set [count _soldierWaypoints, _wp];
				};
			};
			//---------- DEBUG MARKER
			if(_debug) then {
				_soldier spawn {
					_marker = createMarkerLocal [str(_this), position _this];
					_marker setMarkerTypeLocal "mil_objective";
					_marker setMarkerColorLocal "ColorBlack";
					_marker setMarkerSizeLocal [1, 1];
					waitUntil {sleep 0.5;_marker setMarkerPosLocal (getPos _this);!alive _this};
					deleteMarkerLocal _marker;
				};
			};
			//---------- SOLDIER INFO / DEAD EH
			_soldier setVariable ["a3c_gen_place",_place,false];
			_soldier setVariable ["a3c_gen_waypoints",_soldierWaypoints,false];
			_soldier setVariable ["a3c_gen_group",_group,false];
			_soldier addEventHandler ["killed", {
				_lunit = _this select 0;
				_lplace = _lunit getVariable ["a3c_gen_place", objNull];
				_lwaypoints = _lunit getVariable ["a3c_gen_waypoints", []];
				_lgroup = _lunit getVariable ["a3c_gen_group", sideLogic];
				if((count (units _lgroup))<=1) then {
					deleteGroup _lgroup;
					{deleteWaypoint _x;} forEach _lwaypoints;
				};
				_lammount = _lplace getVariable ["a3c_gen_soldiers",0];
				if(_lammount>0) then {_lplace setVariable ["a3c_gen_soldiers",_lammount-1,true];};
			}];
			if(_ammount>10) then {sleep 0.3;};
		};

		//------------ UNGEN CHECK
		waitUntil {
			sleep 5;
			_ungen = false;
			_players = call CBA_fnc_players;
			_nearestPlayer = [_placePos, _players, _distance_land max _distance_air] call CBA_fnc_getNearest;
			if((count _nearestPlayer) == 0) then {_ungen = true;};
			if((_place getVariable ["a3c_gen_soldiers",0])==0) then {_ungen = true;};
			_ungen
		};
		//------------ DELETE SOLDIERS
		{deleteWaypoint _x;} forEach _waypoints;
		{
			_x removeAllEventHandlers "killed";
			_gr = group _x;
			if(alive _x) then {deleteVehicle _x;};
			deleteGroup _gr;
		} forEach _soldiers;
		if(_debug) then {hint ("DEBUG: USUWAM ŻOŁNIERZY!");};

	};
	//------------------------------------------------------------
};
