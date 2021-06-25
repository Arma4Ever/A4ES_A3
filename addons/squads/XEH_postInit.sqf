#include "script_component.hpp"

// Exit if it's main menu intro
if (EGVAR(common,isMainMenu)) exitWith {};

// JIP squad detection
if (hasInterface) then {
  [{

    private _squad = player getVariable [QGVAR(squad), objNull];
    // Exit if player has no squad
    if (isNull _squad) exitWith {};
    // Trigger squad changed event
    [QGVAR(squadChanged), []] call CBA_fnc_localEvent;
  }, []] call CBA_fnc_execNextFrame;
};

// Exit if not server
if !(isServer) exitWith {};

// Add server event handlers
[QGVAR(joinSquad), {_this call FUNC(joinSquad)}] call CBA_fnc_addEventHandler;
[QGVAR(leaveSquad), {_this call FUNC(leaveSquad)}] call CBA_fnc_addEventHandler;
[QGVAR(setSquadLeader), {_this call FUNC(setSquadLeader)}] call CBA_fnc_addEventHandler;
[QGVAR(killed), {_this call FUNC(handleKilled)}] call CBA_fnc_addEventHandler;
[QGVAR(respawn), {_this call FUNC(handleRespawn)}] call CBA_fnc_addEventHandler;
["CBA_teamColorChanged", {
    params ["_unit", "_team"];

    // Save unit assigned team globally (for JIP support and dummy units)
    _unit setVariable [QGVAR(assignedTeam), _team, true];
}] call CBA_fnc_addEventHandler;

// Parse playable units groups some time after start
// We're giving some time for things like ace setName etc.
[{
  private _units = playableUnits + switchableUnits;
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
}, [], 3] call CBA_fnc_waitAndExecute;
