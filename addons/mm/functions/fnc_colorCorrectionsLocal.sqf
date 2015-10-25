/*
	Author: SzwedzikPL

	Description:
	Display color correction Effect
*/
#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(isDedicated) exitWith {};

if (_activated) then {

	private ["_effectType","_effectArray","_ppEffect"];

	_effectType = _logic getvariable ["effecttype",""];
	_effectArray = [];

	switch _effectType do {
		case ("dayz"): {
			_effectArray = [1, 1.06, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.4, 1.4, 1.5], [0.199, 0.587, 0.114, 0.0]];
		};
		case ("ofp"): {
			_effectArray = [1, 1, 0, [0, 0, 0, 0], [1, 1, 1.2, 0.85], [1, 1, -2.5, 0]];
		};
		case ("a2"): {
			_effectArray = [1, 1.24, -0.004, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.7, 0.7], [0.199, 0.587, 0.114, 0.0]];
		};
		case ("a2oa"): {
			_effectArray = [ 1.0, 1, -0.003, [0.2, 0.15, -0.0, 0.125],[-2, -1.5, -1, 0.55],[-0.54, -0.53, 0.4, -0.09]];
		};
		case ("zima"): {
			_effectArray = [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.3], [0.399, 0.287, 0.014, 0.0]]
		};
		case ("wiosna"): {
			_effectArray = [1, 1.15, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.2, 1.2, 1.4], [0.199, 0.587, 0.114, 0.0]];
		};
		case ("jesien"): {
			_effectArray = [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];
		};
		case ("sloneczny_dzien"): {
			_effectArray = [1, 1.35, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.3, 1.3, 1.4], [0.199, 0.587, 0.114, 0.0]];
		};
		case ("deszczowy_dzien"): {
			_effectArray = [1, 1, 0, [0, 0, 0, -0.31],[1.9, 1.9, 1.73, 0.7],[0.2, 1.1, -1.5, 1.64]];
		};
		case ("afryka"): {
			_effectArray = [1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]];
		};
		case ("pustynia"): {
			_effectArray = [1, 0.6, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.8],[1.43, 0.56, 3.69, 0.31]];
		};
		case ("postapo"): {
			_effectArray = [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
		};
	};

	if(count _effectArray == 0) exitWith {true};

	_ppEffect = ppEffectCreate ["colorCorrections", 5];
	_ppEffect ppEffectEnable true;
	_ppEffect ppEffectAdjust _effectArray;
	_ppEffect ppEffectCommit 0;
};

true
