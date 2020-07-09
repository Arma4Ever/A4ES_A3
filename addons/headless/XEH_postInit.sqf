#include "script_component.hpp"

// Exit if not multiplayer or has interface (not server nor headless)
if (!isMultiplayer || hasInterface) exitWith {};

if (isServer) then {
  // Handle HC disconnect
  addMissionEventHandler ["HandleDisconnect", {
    params ["_object"];

    if (_object isEqualTo GVAR(headlessClient)) then {
      GVAR(headlessClient) = objNull;
    };

    true;
  }];
} else {
  GVAR(unitsToRestoreLoadout) = [];
  GVAR(restoringLoadoutScheduled) = false;

  ["CAManBase", "Local", {
    _this call FUNC(handleLocal);
  }] call CBA_fnc_addClassEventHandler;

  [QGVAR(headlessConnected), [player]] call CBA_fnc_serverEvent;
};
