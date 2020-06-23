#include "script_component.hpp"

if (hasInterface) then {
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

if (isServer) then {
  [{
    ["ModuleCurator_F", "Init", {
      _this call FUNC(initCurator);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  }, [], 0.5] call CBA_fnc_waitAndExecute;
};
