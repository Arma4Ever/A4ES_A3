#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * revealAllPlayers curator module function
 */

params ["_logic"];
deleteVehicle _logic;

[QGVAR(revealAllPlayers), 0] call CBA_fnc_globalEvent;
[objNull, LLSTRING(revealAllPlayers_PlayersRevealed)] call BIS_fnc_showCuratorFeedbackMessage;