#include "\z\ace\addons\microdagr\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Get marker type & color
 */
params ["_markerType"];

private _markerColorType = 0;
private _markerName = "";
private _markerIcon = "";
private _markerColor = [];

private _colors = [
  [[0, 0.3, 0.6, 1], "ColorWEST"], // Blue
  //[[0.5, 0, 0, 1], "ColorEAST"], // Red
  [[0, 0.5, 0, 1], "ColorGUER"], // Green
  [[0.7, 0.6, 0, 1], "ColorUNKNOWN"], // Yellow
  [[0.4, 0, 0.5, 1], "ColorCIV"] // Purple
];

// Auto
if (_markerType == 0) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Auto", "b_unknown", _colors # 0]
};

// Infantry
if (_markerType in [1,2,3,4]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Inf", "b_inf", _colors select (_markerType - 1)]
};

// Infantry Motor
if (_markerType in [5,6,7,8]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Motor", "b_motor_inf", _colors select (_markerType - 5)]
};

// Infantry Mech
if (_markerType in [9,10,11,12]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Mech", "b_mech_inf", _colors select (_markerType - 9)]
};

// Med
if (_markerType in [13,14,15,16]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Med", "b_med", _colors select (_markerType - 13)]
};

// Recon
if (_markerType in [17,18,19,20]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Recon", "b_recon", _colors select (_markerType - 17)]
};

// Armor
if (_markerType in [21,22,23,24]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Armor", "b_armor", _colors select (_markerType - 21)]
};

// Helicopter
if (_markerType in [25,26,27,28]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Air", "b_air", _colors select (_markerType - 25)]
};

// Plane
if (_markerType in [29,30,31,32]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Plane", "b_plane", _colors select (_markerType - 29)]
};

// Mortar
if (_markerType in [33,34,35,36]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Mortar", "b_mortar", _colors select (_markerType - 33)]
};

// Artillery
if (_markerType in [37,38,39,40]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Art", "b_art", _colors select (_markerType - 37)]
};

// Service & Maint
if (_markerType in [41,42,43,44]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Maint", "b_maint", _colors select (_markerType - 41)]
};

// Ship
if (_markerType in [45,46,47,48]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Naval", "b_naval", _colors select (_markerType - 45)]
};

// HQ
if (_markerType in [49,50,51,52]) exitWith {
  ["HQ", "b_hq", _colors select (_markerType - 49)]
};

// Dot
if (_markerType in [53,54,55,55]) exitWith {
  [localize "STR_A4ES_Microdagr_Icon_Dot", "hd_dot", _colors select (_markerType - 53)]
};

["Nieznany", "b_unknown", _colors # 0]
