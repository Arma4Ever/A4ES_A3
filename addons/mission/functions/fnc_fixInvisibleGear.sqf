#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Fixes invisible gear in multiplayer
 */

if (GVAR(fixingInvisibleGear)) exitWith {};

// Prevent overlap
GVAR(fixingInvisibleGear) = true;

// Save loadout
private _loadout = getUnitLoadout [ace_player, false];

// Remove unit gear
removeUniform ace_player;
removeVest ace_player;
removeBackpack ace_player;

// Refresh unit loadout after some time for proper sync
[{
  ace_player setUnitLoadout [_this, false];
  GVAR(fixingInvisibleGear) = false;
}, _loadout, 0.25] call CBA_fnc_waitAndExecute;
