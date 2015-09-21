#include "script_component.hpp"

ADDON = false;

ace_microdagr_fnc_getMarker = compile preProcessFileLineNumbers "z\a3cs\addons\microdagr\functions\fnc_getMarker.sqf";
ace_microdagr_fnc_simpleGps = compile preProcessFileLineNumbers "z\a3cs\addons\microdagr\functions\fnc_simpleGps.sqf";

ADDON = true;