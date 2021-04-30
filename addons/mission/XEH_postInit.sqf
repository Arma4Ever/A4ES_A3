#include "script_component.hpp"

// Exit if main menu
if (EGVAR(common,isMainMenu)) exitWith {};

if (isServer) then {
  [{
    private _respawn = getMissionConfigValue ["respawn", 0];
    // Exit if respawn enabled
    if (_respawn isNotEqualTo 0) exitWith {};
    // Remove all playable units from garbage collection
    removeFromRemainsCollector ([switchableUnits, playableUnits] select isMultiplayer);
  }, [], 0.1] call CBA_fnc_waitAndExecute;

  // Enable simulation of dead units, it's groups and vehicles for dynamically simulated groups/agents
  addMissionEventHandler ["EntityKilled", {
    params ["_entity"];

    if (
      !(_entity isKindOf "CAManBase") ||
      {simulationEnabled _entity} ||
      {isNull _entity}
    ) exitWith {};

    private _target = group _entity;
    private _targetUnits = units _target;
    // Target unit if group is null (agents)
    if (isNull _target) then {
      _target = _entity;
      _targetUnits = [_entity];
    };

    // Don't react if disabled simulation is not by dyn sim
    if !(dynamicSimulationEnabled _target) exitWith {};

    // Disable target dyn sim and enable sim for all units
    _target enableDynamicSimulation false;
    {
      _x enableSimulationGlobal true;false
    } count _targetUnits;

    // Check vehicle
    private _vehicle = objectParent _entity;

    // Exit if no vehicle, vehicle sim enabled or dyn sim is not reason for disabled sim
    if (isNull _vehicle || {simulationEnabled _vehicle} || {!(dynamicSimulationEnabled _vehicle)}) exitWith {};

    _vehicle enableDynamicSimulation false;
    _vehicle enableSimulationGlobal true;
  }];
};

// Exit if no interface
if (!hasInterface) exitWith {};

// Disable all channels except global & side
for "_i" from 2 to 15 do {
  _i enableChannel false;
};

// Block channels except global & side
// enableChannel command can't disable group chat
[{
  if (currentChannel > 1) then {
    setCurrentChannel 0;
  };
}, 0, []] call CBA_fnc_addPerFrameHandler;

// Exec after mission start
[{
  // Exit if player joined in progress
  if (didJIP) exitWith {};

  // Lock player weapon
  [player, currentWeapon player, true] call ACEFUNC(safemode,setWeaponSafety);

  [{
    // Lower player weapon
    if !(weaponLowered player) then {
      player action ["WeaponOnBack", player];
    };
  }, [], 0.1] call CBA_fnc_waitAndExecute;
}, [], 0.01] call CBA_fnc_waitAndExecute;
