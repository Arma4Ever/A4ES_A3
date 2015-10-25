#include "script_component.hpp"

params ["_unit"];

if(!local _unit) exitWith {};

//No rating - friendly fire ai fix
_unit addEventHandler ["HandleRating", {0}];
