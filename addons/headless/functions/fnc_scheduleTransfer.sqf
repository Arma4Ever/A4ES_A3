#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Schedules group transfer if applicable
 */

if (GVAR(transferScheduled)) exitWith {
  LOG("Scheduling transfer aborted - transfer is already scheduled.");
};

GVAR(transferScheduled) = true;

LOG("Scheduling transfer - 15 sec.");

[{
  false call FUNC(transferGroups);
}, [], 15] call CBA_fnc_waitAndExecute;
