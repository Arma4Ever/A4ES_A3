/*
 * Author: SzwedzikPL
 * makeCarryable local function
 */
#include "script_component.hpp"

params ["_objects", "_carryable", "_carryOffset", "_carryDir"];

{
    [_x, _carryable, _carryOffset, _carryDir] call ace_dragging_fnc_setCarryable;
} forEach _objects;
