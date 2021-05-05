#include "script_component.hpp"

if (hasInterface) then {
  // Check if player has default "G" as throw keybind
  if ((actionKeys "Throw") isEqualTo [34]) then {
    [{!(isNull (findDisplay 46))}, {
        [
          localize LSTRING(Warning_Message),
          localize LSTRING(Warning_Message_Header),
          true
        ] spawn BIS_fnc_guiMessage;
    }] call CBA_fnc_waitUntilAndExecute;
  };
};

// Exit if main menu
if (EGVAR(common,isMainMenu)) exitWith {};

[QGVAR(deleteGroup), {
  params ["_group"];
  deleteGroup _group;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  [{
    private _respawn = getMissionConfigValue ["respawn", 0];
    // Exit if respawn enabled
    if (_respawn isNotEqualTo 0) exitWith {};
    // Remove all playable units from garbage collection
    removeFromRemainsCollector ([switchableUnits, playableUnits] select isMultiplayer);
  }, [], 0.1] call CBA_fnc_waitAndExecute;

  // Schedule first cleanup of empty groups
  [{0 spawn FUNC(cleanupEmptyGroups)}, [], EMPTY_GROUPS_CLEANUP_INTERVAL] call CBA_fnc_waitAndExecute;

  // Enable simulation of dead units, it's groups and vehicles for dynamically simulated groups/agents
  addMissionEventHandler ["EntityKilled", {
    params ["_entity"];

    if (
      !(_entity isKindOf "CAManBase") ||
      {simulationEnabled _entity}
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

// Exec after mission start
[{
  // Disable ambient life
  enableEnvironment [false, environmentEnabled # 1];
  [{enableEnvironment [false, environmentEnabled # 1];}, 30] call CBA_fnc_addPerFrameHandler;

  // Validate mission template
  if ((getMissionConfigValue ["a3c_missionTemplate", 0]) < REQUIRED_MISSION_TEMPLATE_VERSION) then {
    0 spawn {
      sleep 3;
      diag_log localize LSTRING(WrongMissionTemplateWarning);
      systemChat localize LSTRING(WrongMissionTemplateWarning);
    };
  };

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
