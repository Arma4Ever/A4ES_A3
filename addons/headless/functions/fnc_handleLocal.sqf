#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles unit locality change
 */

params ["_unit", "_local"];

// Exit if unit is not local
if !(_local) exitWith {};

LOG_1("Handling local change for unit %1.",str _unit);

// Reexecute 3DEN unit init
_unit call EFUNC(editor,initUnit);

// Collect units with loadout bug
if ((uniform _unit) isEqualTo "") then {
  LOG("Naked unit detected.");
  GVAR(unitsToRestoreLoadout) pushBack _unit;
  if !(GVAR(restoringLoadoutScheduled)) then {
    GVAR(restoringLoadoutScheduled) = true;
    LOG("Scheduling loadout restore.");

    // Send bugged units to server for loadout restore
    // Loadouts are stored only on server for network performance reasons
    [{
      LOG_1("Sending units to server for restoring loadout (units count: %1).",str (count GVAR(unitsToRestoreLoadout)));
      [QGVAR(restoreUnitsLoadout), GVAR(unitsToRestoreLoadout)] call CBA_fnc_serverEvent;
      // Wait for loadout to be restored
      [{
        LOG_1("Reexecuint editor unit init for %1 units.",str (count _this));
        {
          // Exec unit editor init again
          _x call EFUNC(editor,initUnit);
        } forEach _this;
      }, (+GVAR(unitsToRestoreLoadout)), 5] call CBA_fnc_waitAndExecute;
      GVAR(unitsToRestoreLoadout) = [];
      GVAR(restoringLoadoutScheduled) = false;
    }, [], 1] call CBA_fnc_waitAndExecute;
  };
};
