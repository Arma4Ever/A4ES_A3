#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!_activated) exitWith {};
if(!isServer) exitWith {};

private ["_object","_mode","_dmg","_lampclasses","_objSize","_objShape","_objPos"];

_object = call compile (_logic getVariable ["object", ""]);
_mode = _logic getvariable ["mode", "off"];

_dmg = switch (_mode) do {
  case "on": {0};
  case "off": {0.92};
};

_lampclasses = [
    //arma 3
    "Lamps_Base_F",
    "PowerLines_base_F",
    "Land_PowerPoleWooden_F",
    "Land_PowerPoleWooden_L_F",
    "Land_PowerPoleWooden_small_F",
    "Land_LampAirport_F",
    "Land_LampDecor_F",
    "Land_LampHalogen_F",
    "Land_LampHarbour_F",
    "Land_LampShabby_F",
    "Land_LampSolar_F",
    "Land_LampStadium_F",
    "Land_LampStreet_F",
    "Land_LampStreet_small_F",
    //arma 2
    "StreetLamp",
    "Land_PowLines_WoodL",
    "Land_PowLines_ConcL",
    "Land_lampa_ind_zebr",
    "Land_lampa_sidl_3",
    "Land_lampa_vysoka",
    "Land_lampa_ind",
    "Land_lampa_ind_b",
    "Land_lampa_sidl",
    "Land_PowLines_Conc2L_EP1",
    "Land_Lamp_Street1_EP1",
    "Land_Lamp_Street2_EP1",
    "Land_Lamp_Small_EP1",
    "Land_Lampa_Ind_EP1"
];
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
_objSize = switch (_objShape) do {
  case "ellipse": {_objSize + (_objSize/5)};
  case "rectangle": {_objSize + (_objSize/2)};
};
{
	if([_x,_object] call CBA_fnc_inArea) then {
		if(damage _x<1) then {_x setDamage _dmg;};
	};
} forEach nearestObjects [_objPos, _lampclasses, _objSize];
