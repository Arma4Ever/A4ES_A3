#include "script_component.hpp"

// Activate all addons
private _addons = configProperties [configFile >> "CfgPatches", "isClass _x"] apply {configName _x};
_addons call BIS_fnc_activateAddons;

if (isServer) then {
  // Unassign player from zeus if player is disconnected
  // Fixes A3 bug when zeus cannot return to slot
  addMissionEventHandler ["HandleDisconnect", {
    _this call FUNC(unassignCuratorModule);
    false
  }];

  // Reset curator points every 15 sec
  [{
    {
      _x addCuratorPoints 1;
    } forEach allCurators;
  }, 15] call CBA_fnc_addPerFrameHandler;
};

if (hasInterface) then {
  #include "initKeybinds.inc.sqf"

  if ((typeOf player) == "VirtualCurator_F") then {
    player setVariable [QGVAR(isCurator), true, true];
  };

  // Assign zeus & request logic flags
  [{
    if (player getVariable [QGVAR(isCurator), false]) then {
      LOG("Requesting player curator module");
      [QGVAR(assignCuratorModule), [player, true]] call CBA_fnc_serverEvent;
      [QGVAR(requestLogicFlagsList), [player]] call CBA_fnc_serverEvent;
    };
  }, [], ([0.1, 2.5] select isMultiplayer)] call CBA_fnc_waitAndExecute;

  // 3D players drawing during remote control
  ["unit", {
    // Exit if player is not curator
    if (isNull (getAssignedCuratorLogic player)) exitWith {};

    [{
      if (isNil "bis_fnc_moduleRemoteControl_unit") then {
        LOG("Disabling draw of players icons");
        removeMissionEventHandler ["Draw3D", GVAR(playersIconsDraw)];
      } else {
        LOG("Enabling draw of players icons");
        GVAR(playersIconsDraw) = addMissionEventHandler ["Draw3D", {_this call FUNC(drawPlayersIcons)}];
      };
    }, []] call CBA_fnc_execNextFrame;
  }] call CBA_fnc_addPlayerEventHandler;
};
