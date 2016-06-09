/*
 * Author: SzwedzikPL
 * On player killed event in vanilla respawn system
 */
#include "script_component.hpp"

params ["_player", "_killer"];

if (isMultiplayer) then {
    _this call BIS_fnc_respawnSpectator;
} else {
    _this call BIS_fnc_respawnNone;
};
