#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

[QGVAR(transferReport), {
  params ["_transferAttempts", "_successPercent", "_groupsPercent"];
  if (_transferAttempts > 0) then {
    systemChat format [
      localize LSTRING(transferReport_attempts),
      _successPercent,
      _groupsPercent,
      "%"
    ];
  } else {
    systemChat localize LSTRING(transferReport_noAttempts);
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(headlessConnectedInfo), {
  systemChat localize LSTRING(headlessConnectedInfo);
}] call CBA_fnc_addEventHandler;

if (!isServer) exitWith {};

GVAR(headlessClient) = objNull;
GVAR(transferScheduled) = false;

// Handle headless connected
[QGVAR(headlessConnected), {
  params ["_object"];
  LOG_2("Registering connected headless (object: %1 owner: %2)",str _object,str (owner _object));
  GVAR(headlessClient) = _object;

  // Send HC connection confirmation on chat globally
  [{
    [QGVAR(headlessConnectedInfo), []] call CBA_fnc_globalEvent
  }, [], 0.5] call CBA_fnc_waitAndExecute;

  // Initial transfer
  LOG("Scheduling initial transfer");
  GVAR(transferScheduled) = true;
  [{
    // Exec initial groups transfer
    true call FUNC(transferGroups);
  }, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
