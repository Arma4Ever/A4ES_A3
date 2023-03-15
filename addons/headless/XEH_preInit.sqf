#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

[QGVAR(headlessConnectedInfo), {
  params ["_count"];
  systemChat format [LLSTRING(headlessConnectedInfo), _count];
}] call CBA_fnc_addEventHandler;

[QGVAR(requestFPS), {
  [QGVAR(headlessFPS), [player, floor diag_fps]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;


if !(isServer) exitWith {};

GVAR(headlessClients) = [];
GVAR(lastAIBasedSelection) = 0;

[QGVAR(moveHeadlessClients), {
  params ["_pos"];
  {_x setPos _pos;} forEach GVAR(headlessClients);
}] call CBA_fnc_addEventHandler; 

[QGVAR(headlessFPS), {
  params ["_client", "_fps"];

  _client setVariable [QGVAR(diagFPS), _fps];
}] call CBA_fnc_addEventHandler;

// Handle headless connected
[QGVAR(headlessConnected), {
  params ["_client"];
  LOG_2("Registering connected headless (object: %1 owner: %2)",str _client,str (owner _client));

  private _clients = missionNamespace getVariable [QGVAR(headlessClients), []];
  _clients pushBackUnique _client;

  // Update headless clients list globally
  missionNamespace setVariable [QGVAR(headlessClients), _clients, true];

  // Send HC connection confirmation on chat globally
  [{
    [QGVAR(headlessConnectedInfo), _this] call CBA_fnc_globalEvent
  }, [count _clients], 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
