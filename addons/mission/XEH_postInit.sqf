#include "script_component.hpp"

if (hasInterface) then {
  disableRemoteSensors true;

  // Check if player has default "G" as throw keybind
  if ((actionKeys "Throw") isEqualTo [34]) then {
    [{!(isNull (findDisplay 46))}, {
        [
          LLSTRING(Warning_Message),
          LLSTRING(Warning_Message_Header),
          true
        ] spawn BIS_fnc_guiMessage;
    }] call CBA_fnc_waitUntilAndExecute;
  };
};

// Exit if main menu
if (EGVAR(common,isMainMenu)) exitWith {};

if (isServer) then {
  [{
    private _respawn = getMissionConfigValue ["respawn", 0];
    // Exit if respawn enabled
    if (_respawn isNotEqualTo 0) exitWith {};

    // Remove all playable units from garbage collection
    ["CAManBase", "initPost", {
      params ["_unit"];

      if (isPlayer _unit || {_unit in playableUnits}) then {
        removeFromRemainsCollector [_unit];
      };
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  }, [], 0.1] call CBA_fnc_waitAndExecute;

  // Schedule first cleanup of empty groups
  // [{0 spawn FUNC(cleanupEmptyGroups)}, [], EMPTY_GROUPS_CLEANUP_INTERVAL] call CBA_fnc_waitAndExecute;

  // Enable simulation of dead units, it's groups and vehicles for dynamically simulated groups/agents
  addMissionEventHandler ["EntityKilled", {
    _this call FUNC(handleEntityKilled);
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
      diag_log text LLSTRING(WrongMissionTemplateWarning);
      systemChat LLSTRING(WrongMissionTemplateWarning);
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
