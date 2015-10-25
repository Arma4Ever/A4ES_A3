#include "script_component.hpp"
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	//------------------------------------------------------------
    _place = call compile (_logic getVariable ["place", ""]);
    _marker = call compile (_logic getVariable ["marker", ""]);
    _ammount = _logic getvariable ["ammount",0];
    _side = call compile (_logic getVariable ["side", ""]);
    _classes = call compile (_logic getVariable ["classes", ""]);
    _condition = call compile (_logic getVariable ["condition", ""]);
    _ingroup = _logic getVariable ["ingroup", true];
    _script = compile (_logic getVariable ["script", ""]);
    _ignore = call compile (_logic getVariable ["ignore", ""]);

    if(isNil "_ignore") then {_ignore = [];};
    if(typename _ignore != typename []) then {_ignore = [];};

	//------------------------------------------------------------
	if(!isServer) exitWith {};
	_debug = !isMultiplayer;
	_timer = false;
	if (typeName _condition == "SCALAR") then {
		_place setVariable ["timer", true, false];
		[_place,_condition] spawn {
			sleep (_this select 1);
			(_this select 0) setVariable ["timer", false, false];
			if(!isMultiplayer) then {systemchat "czas minal";};
		};
		_condition = {_place getVariable ["timer",true];};
	};
	//------------------------------------------------------------
	if(_ingroup) then {
		_placePos = getPos _place;
		_placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
		_placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
		_placeSize = switch (_placeShape) do {case "ellipse": {_placeSize + (_placeSize/5)};case "rectangle": {_placeSize + (_placeSize/2)};};
		while _condition do {
			if(_debug) then {systemchat "generuje zolnierzy do ataku";};
			_soldierPos = [];
			waitUntil {
				_havePos = true;
				_soldierPos = [_placePos, _placeSize] call CBA_fnc_randPos;
				if (!([_soldierPos, _place] call CBA_fnc_inArea)) then {_havePos = false;};
				{if([_soldierPos, _x] call CBA_fnc_inArea) then {_havePos = false;};} forEach _ignore;
				_havePos
			};
			_group = createGroup _side;
			for [{_x=1},{_x<=_ammount},{_x=_x+1}] do {
				[_group,_soldierPos,_classes,_script] spawn {
					_debug = if(isMultiplayer) then {false} else {true};
					_group = (_this select 0);
					_soldier = _group createUnit [(_this select 2) call BIS_fnc_selectRandom, (_this select 1), [], 0, "FORM"];
					[_soldier] join _group;
					_soldier spawn (_this select 3);
					_soldier allowFleeing 0;
					if(_debug) then {
						_soldier spawn {
							_marker = createMarkerLocal [str(_this), position _this];
							_marker setMarkerTypeLocal "mil_objective";
							_marker setMarkerColorLocal "ColorRed";
							_marker setMarkerSizeLocal [1, 1];
							waitUntil {sleep 0.5;_marker setMarkerPosLocal (getPos _this);!alive _this};
							deleteMarkerLocal _marker;
						};
					};
				};
				sleep 0.1;
			};
			sleep 0.05;
			while {(count (waypoints _group)) > 0} do {deleteWaypoint ((waypoints _group) select 0);};
			sleep 0.05;
			_wp = _group addwaypoint [getmarkerpos _marker,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointSpeed "FULL";
			_deadMembers = {
				_grp = _this;
				_ret = true;
				{if(alive _x) then {_ret = false;};} forEach (units _grp);
				_ret
			};
			waitUntil {sleep 1;_group call _deadMembers};
			deleteWaypoint _wp;
			deleteGroup _group;
			sleep 1;
		};
		if(_debug) then {systemchat "koniec ataku";};
	} else {
		for [{_x=1},{_x<=_ammount},{_x=_x+1}] do {
			[_place,_classes,_condition,_script,_side,_marker,_ignore] spawn {
				_place = _this select 0;
				_classes = _this select 1;
				_condition = _this select 2;
				_script = _this select 3;
				_side = _this select 4;
				_marker = _this select 5;
				_ignore = _this select 6;
				_debug = if(isMultiplayer) then {false} else {true};
				_placePos = getPos _place;
				_placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
				_placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
				_placeSize = switch (_placeShape) do {case "ellipse": {_placeSize + (_placeSize/5)};case "rectangle": {_placeSize + (_placeSize/2)};};
				_group = createGroup _side;
				while _condition do {
					if(_debug) then {systemchat "generuje zolnierzy do ataku";};
					_soldierPos = [];
					waitUntil {
						_havePos = true;
						_soldierPos = [_placePos, _placeSize] call CBA_fnc_randPos;
						if (!([_soldierPos, _place] call CBA_fnc_inArea)) then {_havePos = false;};
						{if([_soldierPos, _x] call CBA_fnc_inArea) then {_havePos = false;};} forEach _ignore;
						_havePos
					};
					_debug = if(isMultiplayer) then {false} else {true};
					_soldier = _group createUnit [_classes call BIS_fnc_selectRandom, _soldierPos, [], 0, "FORM"];
					_soldier spawn _script;
					_soldier allowFleeing 0;
					if(_debug) then {
						_soldier spawn {
							_marker = createMarkerLocal [str(_this), position _this];
							_marker setMarkerTypeLocal "mil_objective";
							_marker setMarkerColorLocal "ColorRed";
							_marker setMarkerSizeLocal [1, 1];
							waitUntil {sleep 0.5;_marker setMarkerPosLocal (getPos _this);!alive _this};
							deleteMarkerLocal _marker;
						};
					};
					sleep 0.05;
					while {(count (waypoints _group)) > 0} do {deleteWaypoint ((waypoints _group) select 0);};
					sleep 0.05;
					_wp = _group addwaypoint [getmarkerpos _marker,0];
					_wp setWaypointType "MOVE";
					_wp setWaypointBehaviour "AWARE";
					_wp setWaypointCombatMode "RED";
					_wp setWaypointSpeed "FULL";
					waitUntil {sleep 1;!alive _soldier};
					deleteWaypoint _wp;
					sleep 1;
				};
				deleteGroup _group;
				if(_debug) then {systemchat "koniec ataku";};
			};
		};
	};
	//------------------------------------------------------------
};
