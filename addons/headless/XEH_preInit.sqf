#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

[QGVAR(headlessConnectedInfo), {
  systemChat LLSTRING(headlessConnectedInfo);
}] call CBA_fnc_addEventHandler;

if (!isServer) exitWith {};

GVAR(headlessClient) = objNull;

// Handle headless connected
[QGVAR(headlessConnected), {
  params ["_object"];
  LOG_2("Registering connected headless (object: %1 owner: %2)",str _object,str (owner _object));
  GVAR(headlessClient) = _object;

  // Send HC connection confirmation on chat globally
  [{
    [QGVAR(headlessConnectedInfo), []] call CBA_fnc_globalEvent
  }, [], 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
