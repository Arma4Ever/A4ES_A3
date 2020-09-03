#include "script_component.hpp"
/*
 * Author: Jonpas, SzwedzikPL
 * Transfers AI groups to headless client
 */

params [["_initialTransfer", false]];

// Allow scheduling next transfer
GVAR(transferScheduled) = false;

if (isNull GVAR(headlessClient)) exitWith {
  LOG_1("Groups transfer aborted. Headless client is null (initial: %1).",str _initialTransfer);
};

// Exec transfer in scheduled env for easy pausing
_initialTransfer spawn {
  params ["_initialTransfer"];

  private _headlessOwner = owner GVAR(headlessClient);
  private _transfers = 0;
  private _transferAttempts = 0;

  LOG_2("Staring groups transfer (initial: %1 headless owner: %2).",str _initialTransfer,str _headlessOwner);

  private _allGroups = {
    // Check if group should be transfered
    if ([_x, _headlessOwner] call FUNC(shouldTransferGroup)) then {
      // Bumb transfer attempts counter
      _transferAttempts = _transferAttempts + 1;

      // Save group units data before transfer
      {
        private _unit = _x;
        // Save gear if unit about to be transferred with current
        // loadout (in case of need of loadout restoration later).
        _unit setVariable [QGVAR(loadout), getUnitLoadout _x, true];

        // Save AI features
        _unit setVariable [
          QGVAR(disabledAI),
          [
            "TARGET",
            "AUTOTARGET",
            "MOVE",
            "ANIM",
            "TEAMSWITCH",
            "FSM",
            "WEAPONAIM",
            "AIMINGERROR",
            "SUPPRESSION",
            "CHECKVISIBLE",
            "COVER",
            "AUTOCOMBAT",
            "PATH",
            "MINEDETECTION",
            "NVG",
            "LIGHTS",
            "RADIOPROTOCOL"
          ] select {!(_unit checkAIFeature _x)},
          true
        ];
      } forEach (units _x);

      LOG_1('Attempting to transfer group "%1".',groupId _x);

      // Attempt to transfer group
      private _transfered = _x setGroupOwner _headlessOwner;

      // Bumb transfer counter on success
      if (_transfered) then {
        _transfers = _transfers + 1;
        LOG_1('Group "%1" transfered.',groupId _x);

        // Wait for sync (minimizes risk for sync bugs like empty loadout after transfer)
        sleep 0.15;
      };
    };

    // Count all groups
    true
  } count allGroups;

  LOG_3("Groups transfer finished (allGroups: %1 transferAttempts: %2 transfers: %3).",str _allGroups,str _transferAttempts,str _transfers);

  // Do not show transfer report if it's not initial transfer
  if !(_initialTransfer) exitWith {};

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
