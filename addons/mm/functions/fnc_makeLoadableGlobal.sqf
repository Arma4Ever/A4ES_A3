/*
 * Author: SzwedzikPL
 * makeLoadable global function
 */
#include "script_component.hpp"

params ["_objects", "_loadable", "_size"];

{[_x, _loadable, _cargoSize] call ace_cargo_fnc_makeLoadable;} forEach _objects;
