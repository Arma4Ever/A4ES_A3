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
      params ["_unit", "_local"];

      // Collect units with loadout bug
      if (_local && {(uniform _unit) isEqualTo ""}) then {
        GVAR(unitsToRestoreLoadout) pushBack _unit;
        if !(GVAR(restoringLoadoutScheduled)) then {
          GVAR(restoringLoadoutScheduled) = true;

          // Send bugged units to server for loadout restore
          // Loadouts are stored only on server for network performance reasons
          [{
            [QGVAR(restoreUnitsLoadout), GVAR(unitsToRestoreLoadout)] call CBA_fnc_serverEvent;
            GVAR(unitsToRestoreLoadout) = [];
            GVAR(restoringLoadoutScheduled) = false;
          }, [], 5] call CBA_fnc_waitAndExecute;
        };
      };
  }] call CBA_fnc_addClassEventHandler;

  [QGVAR(headlessConnected), [player]] call CBA_fnc_serverEvent;
};
