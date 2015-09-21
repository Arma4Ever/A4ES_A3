/*
 * Author: SzwedzikPL
 * Get marker type & color
 */

#include "\z\ace\addons\microdagr\functions\script_component.hpp"

private ["_markerType", "_markerColorType", "_markerName", "_markerIcon", "_markerColor"];

_markerType = _this select 0;
_unit = _this select 1;
_markerColorType = 0;

_markerName = "";
_markerIcon = "";
_markerColor = [];

_return = [];

//Auto
if(_markerType == 0) then {
	_markerName = "Auto";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_unknown.paa";
	_markerColorType = 0;
};
//Infantry
if(_markerType in [1,2,3,4]) then {
	_markerName = "Piechota";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_inf.paa";
	_markerColorType = [1,2,3,4] find _markerType;
};
//Infantry Motor
if(_markerType in [5,6,7,8]) then {
	_markerName = "Piechota Zmot.";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_motor_inf.paa";
	_markerColorType = [5,6,7,8] find _markerType;
};
//Infantry Mech
if(_markerType in [9,10,11,12]) then {
	_markerName = "Piechota Zmech.";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_mech_inf.paa";
	_markerColorType = [9,10,11,12] find _markerType;
};
//Med
if(_markerType in [13,14,15,16]) then {
	_markerName = "Jedn. Medyczna";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_med.paa";
	_markerColorType = [13,14,15,16] find _markerType;
};
//Recon
if(_markerType in [17,18,19,20]) then {
	_markerName = "Zwiad";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_recon.paa";
	_markerColorType = [17,18,19,20] find _markerType;
};
//Armor
if(_markerType in [21,22,23,24]) then {
	_markerName = "Pancerni";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_armor.paa";
	_markerColorType = [21,22,23,24] find _markerType;
};
//Helicopter
if(_markerType in [25,26,27,28]) then {
	_markerName = "Helikopter";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_air.paa";
	_markerColorType = [25,26,27,28] find _markerType;
};
//Plane
if(_markerType in [29,30,31,32]) then {
	_markerName = "Samolot";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_plane.paa";
	_markerColorType = [29,30,31,32] find _markerType;
};
//Mortar
if(_markerType in [33,34,35,36]) then {
	_markerName = "Mozdzierz";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_mortar.paa";
	_markerColorType = [33,34,35,36] find _markerType;
};
//Artillery
if(_markerType in [37,38,39,40]) then {
	_markerName = "Artyleria";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_art.paa";
	_markerColorType = [37,38,39,40] find _markerType;
};
//Service & Maint
if(_markerType in [41,42,43,44]) then {
	_markerName = "Jedn. Serwis.";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_maint.paa";
	_markerColorType = [41,42,43,44] find _markerType;
};
//HQ
if(_markerType in [45,46,47,48]) then {
	_markerName = "HQ";
	_markerIcon = "a3\ui_f\data\map\Markers\NATO\b_hq.paa";
	_markerColorType = [45,46,47,48] find _markerType;
};

switch (_markerColorType) do {
	case 0: {_markerColor = [0, 0.4, 1, 1];}; //Niebieski
	case 1: {_markerColor = [1, 0.1, 0.1, 1];}; //Czerwony
	case 2: {_markerColor = [0.4, 1, 0, 1];}; //Zielony
	case 3: {_markerColor = [1, 1, 0.4, 1];}; //Zolty
};

[_markerName, _markerIcon, _markerColor]