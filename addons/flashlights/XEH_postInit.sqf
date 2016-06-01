#include "script_component.hpp"

["loadout", {[DFUNC(itemsCheck), []] call CBA_fnc_execNextFrame;}] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[DFUNC(itemsCheck), []] call CBA_fnc_execNextFrame;}] call CBA_fnc_addPlayerEventHandler;
