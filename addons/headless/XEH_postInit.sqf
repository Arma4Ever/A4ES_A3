#include "script_component.hpp"

// Exit if not multiplayer or has interface (not server nor headless)
if (!isMultiplayer || hasInterface) exitWith {};

if (isServer) then {
  // Handle HC disconnect
  addMissionEventHandler ["HandleDisconnect", {
    params ["_client"];

    // Exit if client is not on headless clients list
    private _clients = missionNamespace getVariable [QGVAR(headlessClients), []];
    if !(_client in _clients) exitWith {false};

    // Update headless clients list
    _clients deleteAt (_clients find _client);
    missionNamespace setVariable [QGVAR(headlessClients), _clients, true];

    // Force headless unit existence even if AI for him is disabled
    true
  }];
} else {
  // Mark client as headless
  player setVariable [QGVAR(isHeadless), true, true];

  // Start fps updater
  [{
    [QGVAR(headlessFPS), [player, floor diag_fps]] call CBA_fnc_serverEvent;
  }, 20 + (random 0.5)] call CBA_fnc_addPerFrameHandler;

  // Notify server about connected HC
  [QGVAR(headlessConnected), [player]] call CBA_fnc_serverEvent;
};
