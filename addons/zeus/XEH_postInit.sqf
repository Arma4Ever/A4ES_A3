#include "script_component.hpp"

if (isServer) then {
  [{
    ["ModuleCurator_F", "initPost", {
      _this call FUNC(initCurator);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  }, [], 0.5] call CBA_fnc_waitAndExecute;

  // Unassign player from zeus if player is disconnected
  // Fixes A3 bug when zeus cannot return to slot
  addMissionEventHandler ["HandleDisconnect", {
    params ["_unit"];
    private _module = getAssignedCuratorLogic _unit;
    if (isNull _module) exitWith {false};
    unassignCurator _module;
    false
  }];
};

if (hasInterface) then {
  #include "initKeybinds.sqf"

  ["unit", {
    // Exit if player is not curator
    if (isNull (getAssignedCuratorLogic player)) exitWith {};

    [{
      if (isNil "bis_fnc_moduleRemoteControl_unit") then {
        LOG("Disabling draw of players icons");
        removeMissionEventHandler ["Draw3D", GVAR(playersIconsDraw)];
      } else {
        LOG("Enabling draw of players icons");
        GVAR(playersIconsDraw) = addMissionEventHandler ["Draw3D", DFUNC(drawPlayersIcons)];
      };
    }, []] call CBA_fnc_execNextFrame;
  }] call CBA_fnc_addPlayerEventHandler;
};
