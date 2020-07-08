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
GVAR(spawnHandlerAdded) = false;

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
    // Register init handler for unit spawns during mission
    if !(GVAR(spawnHandlerAdded)) then {
      GVAR(spawnHandlerAdded) = true;
      LOG("Registering spawn handler");
      ["CAManBase", "init", {
        // Handle spawn 5 sec after unit spawn to properly handle unit vars
        [{
          _this call FUNC(handleSpawn);
        }, _this, 5] call CBA_fnc_waitAndExecute;
      }] call CBA_fnc_addClassEventHandler;
    };

    // Exec initial groups transfer
    true call FUNC(transferGroups);
  }, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

// Handle restoring units loadout
[QGVAR(restoreUnitsLoadout), {
  LOG_1("Restoring loadout for %1 units.",str (count _this));
  {
    private _unitLoadout = _x getVariable [QGVAR(loadout), typeOf _x];
    _x setUnitLoadout _unitLoadout;
  } forEach _this;
}] call CBA_fnc_addEventHandler;
