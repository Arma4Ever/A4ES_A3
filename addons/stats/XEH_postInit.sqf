#include "script_component.hpp"

if (!hasInterface || !isMultiplayer) exitWith {};

// Exit if curator/spectator
if ((side (group player)) isEqualTo sideLogic) exitWith {};

GVAR(traveledDist) = 0;
GVAR(bullets) = 0;
GVAR(grenades) = 0;
GVAR(lastPos) = getPos player;

player addEventHandler ["Fired", {
  params ["", "_weapon", "", "", "_ammo"];

  if (_weapon == "Throw") then {
    GVAR(grenades) = GVAR(grenades) + 1;
    ["a3csserver_events_userGrenThrow", [player, _ammo]] call CBA_fnc_serverEvent;
  } else {
    GVAR(bullets) = GVAR(bullets) + 1;
  };
}];

// Add traveled distance updater PFH
[{
  params ["", "_handle"];
  private _curPos = getPos player;
  GVAR(traveledDist) = GVAR(traveledDist) + (GVAR(lastPos) distance _curPos);
  GVAR(lastPos) = _curPos;

  if !(alive player) exitWith {
    _handle call CBA_fnc_removePerFrameHandler;
  };
}, 2] call CBA_fnc_addPerFrameHandler;

// Add server updates PFH
[{
  params ["", "_handle"];

  ["a3csserver_stats_updatePlayer", [
    getPlayerUID player,
    floor GVAR(traveledDist),
    GVAR(bullets),
    GVAR(grenades)]
  ] call CBA_fnc_serverEvent;

  // Reset
  GVAR(traveledDist) = 0;
  GVAR(bullets) = 0;
  GVAR(grenades) = 0;

  if !(alive player) exitWith {
    _handle call CBA_fnc_removePerFrameHandler;
  };
}, 60] call CBA_fnc_addPerFrameHandler;
