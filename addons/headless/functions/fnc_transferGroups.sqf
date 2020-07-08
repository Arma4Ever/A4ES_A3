#include "script_component.hpp"
/*
 * Author: Jonpas, SzwedzikPL
 * Transfers AI groups to headless client
 */

if (isNull GVAR(headlessClient)) exitWith {
  LOG("Groups transfer aborted. Headless client is null.");
};

// Exec transfer in unscheduled env for easy pausing
0 spawn {
  private _headlessOwner = owner GVAR(headlessClient);
  private _transfers = 0;
  private _transferAttempts = 0;

  LOG_1("Staring groups transfer (headless owner: %1).",str _headlessOwner);

  private _allGroups = {
    // Check if group should be transfered
    if ([_x, _headlessOwner] call FUNC(shouldTransferGroup)) then {
      // Bumb transfer attempts counter
      _transferAttempts = _transferAttempts + 1;

      // Attempt to transfer group
      private _transfered = _x setGroupOwner _headlessOwner;

      // Bumb transfer counter on success
      if (_transfered) then {
        _transfers = _transfers + 1;

        // Wait for sync (minimizes risk for sync bugs like empty loadout after transfer)
        sleep 0.15;
      };
    };

    // Count all groups
    true
  } count allGroups;

  LOG_3("Groups transfer finished (allGroups: %1 transferAttempts: %2 transfers: %3).",str _allGroups,str _transferAttempts,str _transfers);

  // Show transfer report on systemChat globally
  if (_transferAttempts > 0) then {
    [QGVAR(transferReport), [
      _transferAttempts,
      floor ((_transfers / _transferAttempts) * 100),
      floor ((_transfers / _allGroups) * 100)
    ]] call CBA_fnc_globalEvent;
  } else {
    [QGVAR(transferReport), [0,0,0]] call CBA_fnc_globalEvent;
  };
};
