#include "script_component.hpp"

if (isServer) then {
  // Unassign player from zeus if player is disconnected
  // Fixes A3 bug when zeus cannot return to slot
  addMissionEventHandler ["HandleDisconnect", {
    _this call FUNC(unassignCuratorModule);
    false
  }];
};

if (hasInterface) then {
  #include "initKeybinds.sqf"

  // Assign zeus
  [{
    if (player getVariable [QGVAR(isCurator), false]) then {
      [QGVAR(assignCuratorModule), [player, true]] call CBA_fnc_serverEvent;
    };
  }, [], ([0.1, 1.5] select isMultiplayer)] call CBA_fnc_waitAndExecute;

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
