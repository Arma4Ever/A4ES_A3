/*
 * Author: SzwedzikPL
 * Removes given action
 */
#include "script_component.hpp"

params ["_object", "_actionID"];

[_object, 0, ["ACE_MainActions","_actionID"]] call ace_interact_menu_fnc_removeActionFromObject;
