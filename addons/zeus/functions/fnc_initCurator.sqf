#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds all playable units to curator
 */

params ["_curator"];

private _playableUnits = [switchableUnits, playableUnits] select isMultiplayer;
_playableUnits = _playableUnits select {!(_x isKindOf "VirtualMan_F")};

_curator addCuratorEditableObjects [_playableUnits, true];
