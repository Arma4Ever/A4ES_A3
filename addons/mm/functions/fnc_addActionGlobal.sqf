/*
 * Author: SzwedzikPL
 * Add action to object
 */
#include "script_component.hpp"

params ["_object", "_action"];

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
