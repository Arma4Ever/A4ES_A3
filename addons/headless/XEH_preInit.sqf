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

if (!isServer) exitWith {};

GVAR(headlessClient) = objNull;

// Handle headless connected
[QGVAR(headlessClientConnected), {
  params ["_object"];
  LOG_2("Registering connected headless (object: %1 owner: %2)",str _object,str (owner _object));
  GVAR(headlessClient) = _object;

  // Exec groups transfer in 5 sec
  LOG("Scheduling groups transfer in 5 sec");
  [DFUNC(transferGroups), [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

// Handle restoring units loadout
[QGVAR(restoreUnitsLoadout), {
  LOG_1("Restoring loadout for %1 units.",str (count _this));
  {
    private _unitLoadout = _x getVariable [QGVAR(loadout), typeOf _x];
    _x setUnitLoadout _unitLoadout;
  } forEach _this;
}] call CBA_fnc_addEventHandler;
