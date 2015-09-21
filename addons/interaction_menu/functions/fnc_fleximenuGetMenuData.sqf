#include "script_component.hpp"

params ["_actionID"];

if(_actionID == "main") exitWith {[]};

private ["_menuData"];

//get actual menu data
_menuData = missionNamespace getVariable [format["a3cs_fleximenudata_%1", _actionID], []];

//clear all old menu data
{
	missionNamespace setVariable [format["a3cs_fleximenudata_%1", _actionID], nil];
} foreach GVAR(fleximenuOptionsData);
GVAR(fleximenuOptionsData) = [];

_menuData