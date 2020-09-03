#include "script_component.hpp"

if (isServer) then {
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

  // Assign zeus
  [{
    if (player getVariable [QGVAR(isCurator), false]) then {
      [player, true] call FUNC(assignZeus);
    };
  }, [], 5] call CBA_fnc_waitAndExecute;

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
