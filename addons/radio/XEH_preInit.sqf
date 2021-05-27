#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
  GVAR(mobileAntennas) = [];
  GVAR(updateMultiplicatorsPFH) = -1;
  GVAR(blackListAnims) = ["amovppnemstpsraswrfldnon", "aadjppnemstpsraswrfldleft", "aadjppnemstpsraswrfldright"];

  [QGVAR(jammersUpdated), {
    [{
      0 call FUNC(scheduleMultiplicatorsUpdate);
    }, [], 0.5] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
