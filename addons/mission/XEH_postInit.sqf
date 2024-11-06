#include "script_component.hpp"

// Disable RHS Engine startup script
RHS_ENGINE_STARTUP_OFF = true;

// Disable CUP lamps check - not pretty but works
CUP_stopLampCheck = true;

0 spawn {
  CUP_stopLampCheck = true;
  for "_i" from 1 to 10 do {
    CUP_stopLampCheck = true;
    sleep 0.5;
  };
  sleep 5;
  // Disable CUP lamps check - make *really* sure
  CUP_stopLampCheck = true;

  // Disable RHS Engine startup script
  RHS_ENGINE_STARTUP_OFF = true;
};

// Disable ambient life
enableEnvironment [false, environmentEnabled # 1, environmentEnabled # 2];
[{
  if (environmentEnabled # 0) then {
    enableEnvironment [false, environmentEnabled # 1, environmentEnabled # 2];
  };
}, 30] call CBA_fnc_addPerFrameHandler;

// Schedule first cleanup of empty groups
[{0 spawn FUNC(cleanupEmptyGroups)}, [], EMPTY_GROUPS_CLEANUP_INTERVAL] call CBA_fnc_waitAndExecute;

// Disable weight limits for carry & drag actions
0 spawn {
  sleep 0.1;
  ACE_maxWeightDrag = 999999;
  ACE_maxWeightCarry = 999999;
};

// Server side stuff
if (isServer) then {
  addMissionEventHandler ["EntityKilled", {_this call FUNC(handleEntityKilled);}];

  [{
    private _respawn = getMissionConfigValue ["respawn", 0];
    // Exit if respawn enabled
    if (_respawn isNotEqualTo 0) exitWith {};

    // Remove all playable units from garbage collection
    ["CAManBase", "initPost", {
      params ["_unit"];

      if (isPlayer _unit || {_unit in (playableUnits + switchableUnits)}) then {
        removeFromRemainsCollector [_unit];
      };
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  }, [], 0.1] call CBA_fnc_waitAndExecute;
};

// Client side stuff
if (hasInterface) then {
  // Set current channel to global
  setCurrentChannel 0;
  // Disable client remote sensors
  disableRemoteSensors true;

  if (getMissionConfigValue [QGVAR(enableLocalMarkers), false]) then {
    addMissionEventHandler ["MarkerCreated", {
      params ["_marker", "", "_owner", "_local"];

      if (
        _local || 
        {isNull _owner} || 
        {time < 1} || 
        {_owner isEqualTo player}
      ) exitWith {};

      deleteMarkerLocal _marker;
    }];
  };

  // Validate mission template
  if (GVAR(checkTemplate) && {(getMissionConfigValue ["a4e_missionTemplate", 0]) < REQUIRED_MISSION_TEMPLATE_VERSION}) then {
    0 spawn {
      sleep 3;
      if (EGVAR(common,isMainMenu)) exitWith {};
      diag_log text LLSTRING(WrongMissionTemplateWarning);
      systemChat LLSTRING(WrongMissionTemplateWarning);
    };
  };

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

  // Add handle chat message handler in multiplayer
  if (isMultiplayer) then {
    addMissionEventHandler ["HandleChatMessage", {
      params ["_channel", "", "_from", "_message", "", "", "", "", "", "", "", "_input"];

      if (
        (_channel != 16) ||
        {CBA_missionTime < 10} ||
        {serverCommandAvailable "#logout"} ||
        {!(
          ((_message select [0, 6]) != "[A4ES]") &&
          {(_input param [0, ""]) != "$STR_MP_CONNECTION_LOOSING"}
        )}
      ) exitWith {};

      diag_log text ("Message blocked: " + _message);
      true
    }];

    // TODO: Add all systemChat messages to admin panel (like last 30 or something like that)
  };
};
