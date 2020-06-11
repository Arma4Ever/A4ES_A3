#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Setups default mission game mode
 */

private _value = "Multiplayer" get3DENMissionAttribute "GameType";

if (QUOTE(ADDON) in _value) exitWith {};

// Set coop as default game mode
"Multiplayer" set3DENMissionAttribute ["GameType", QGVAR(Coop)];
