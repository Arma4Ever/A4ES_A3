/*
 * Author: SzwedzikPL
 * Check is player a server admin
 */
#include "script_component.hpp"

private _unit = player;

private _return = false;

if (!isMultiplayer) exitWith {true};
if (serverCommandAvailable "#logout") exitWith {true};

_return
