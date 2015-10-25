#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {

    _logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _units = [_this,1,[],[[]]] call BIS_fnc_param;
    _activated = [_this,2,true,[true]] call BIS_fnc_param;

    if(!_activated) exitWith {};

	private ["_object","_elements","_number","_objSize","_objShape","_objPos"];

    _object = call compile (_logic getVariable ["object", ""]);
    _elements = call compile (_logic getVariable ["elements", ""]);
    _number = _logic getvariable ["number",0];

	_objSize = 0;
	_objShape = "";
	_objPos = [];
	switch (typename _object) do {
		case "STRING" : {
			_objSize = ((markerSize _object) select 0) max ((markerSize _object) select 1);
			_objShape = tolower (markerShape _object);
			_objPos = getMarkerPos _object;
		};
		case "OBJECT" : {
			_objSize = ((triggerArea _object) select 0) max ((triggerArea _object) select 1);
			_objShape = if ((triggerArea _object) select 3) then {"rectangle"} else {"ellipse"};
			_objPos = getPos _object;
		};
	};
	_objSize = switch (_objShape) do {case "ellipse": {_objSize + (_objSize/5)};case "rectangle": {_objSize + (_objSize/2)};};
	for "_x" from 1 to _number do {
		private ["_pos","_rightPos","_minetype","_dir","_mine"];
		_pos = [];
		_rightPos = false;
		waitUntil {
			_pos = [_objPos, _objSize] call CBA_fnc_randPos;
			_pos set [2,0];
			if ([_pos, _object] call CBA_fnc_inArea) then {_rightPos = true;};
			_rightPos
		};
		_minetype = _elements call BIS_fnc_selectRandom;
		_dir = random 360;
		_mine = createMine [_minetype, _pos, [], 0];
		_mine setDir _dir;
	};
};
