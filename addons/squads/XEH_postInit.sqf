#include "script_component.hpp"

// Exit if it's main menu intro
if (EGVAR(common,isMainMenu)) exitWith {};

// Exit if not server
if !(isServer) exitWith {};

// Add server event handlers
[QGVAR(joinSquad), DFUNC(joinSquad)] call CBA_fnc_addEventHandler;
[QGVAR(leaveSquad), DFUNC(leaveSquad)] call CBA_fnc_addEventHandler;
[QGVAR(setSquadLeader), DFUNC(setSquadLeader)] call CBA_fnc_addEventHandler;
[QGVAR(killed), DFUNC(handleKilled)] call CBA_fnc_addEventHandler;
[QGVAR(respawn), DFUNC(handleRespawn)] call CBA_fnc_addEventHandler;

// Parse playable units groups one second after start
// We're giving some time for things like ace setName etc.
[{
  private _units = [[player], playableUnits] select isMultiplayer;
  private _parsedGroups = [];
  private _squads = [];

  {
    private _group = group _x;
    if !(_group in _parsedGroups) then {
      private _squad = _group call FUNC(createSquad);
      _squads pushback _squad;
      _parsedGroups pushBack _group;
    };
  } forEach _units;

  _squads call FUNC(triggerSquadChanged);
}, [], 1] call CBA_fnc_waitAndExecute;
