#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

// Overrides the default weather (editor, mission settings) with ACE weather (map based)
[_logic, "ace_weather_useACEWeather", "useACEWeather"] call ace_common_fnc_readSettingFromModule;
