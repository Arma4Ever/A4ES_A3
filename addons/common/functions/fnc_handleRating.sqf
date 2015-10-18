#include "script_component.hpp"

params ["_unit"];

if(!isPlayer _unit) exitWith {};
if(!local _unit) exitWith {};

//No rating - friendly fire ai fix
_unit addEventHandler ["HandleRating", {0}];
