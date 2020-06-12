#include "script_component.hpp"

if !(isServer) exitWith {};

// Add server event handlers
[QGVAR(joinSquad), DFUNC(joinSquad)] call CBA_fnc_addEventHandler;
[QGVAR(leaveSquad), DFUNC(leaveSquad)] call CBA_fnc_addEventHandler;
[QGVAR(setSquadLeader), DFUNC(setSquadLeader)] call CBA_fnc_addEventHandler;
[QGVAR(killed), DFUNC(handleKilled)] call CBA_fnc_addEventHandler;
[QGVAR(respawn), DFUNC(handleRespawn)] call CBA_fnc_addEventHandler;

// Parse playable units groups
private _parsedGroups = [];

{
  private _group = group _x;
  if !(_group in _parsedGroups) then {
    private _squad = _group call FUNC(createSquad);
    _parsedGroups pushBack _group;
  };
} forEach playableUnits;
