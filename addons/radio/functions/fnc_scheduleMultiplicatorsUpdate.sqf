#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Schedules TFAR radio multiplicators update
 */

LOG("scheduleMultiplicatorsUpdate");

// Update multiplicators
0 call FUNC(updatePlayerMultiplicators);

// Create/remove PFH is needed/not needed
if (
  ((missionNamespace getVariable [QGVAR(radioJammers), []]) isNotEqualTo []) ||
  {GVAR(mobileAntennas) isNotEqualTo []}
) then {
  // Create PFH if not created yet
  if (GVAR(updateMultiplicatorsPFH) isEqualTo -1) then {
    LOG("Creating updateMultiplicatorsPFH");
    GVAR(updateMultiplicatorsPFH) = [{0 call FUNC(updatePlayerMultiplicators)}, 5] call CBA_fnc_addPerFrameHandler;
  };
} else {
  // Remove PFH if not created
  if (GVAR(updateMultiplicatorsPFH) isNotEqualTo -1) then {
    LOG("Removing updateMultiplicatorsPFH");
    [GVAR(updateMultiplicatorsPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(updateMultiplicatorsPFH) = -1;
  };
};
