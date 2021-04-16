#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers new unique map and returns it's class
 */

// This should be executed only on server
if !(isServer) exitWith {};

private _id = (count GVAR(maps)) + 1;

// Exit if no more unique maps
if (_id > 1000) exitWith {""};

private _map = "a3cs_maps_" + str _id;

GVAR(maps) set [_map, createHashMap];

_map
