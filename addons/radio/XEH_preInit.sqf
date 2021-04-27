#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
  GVAR(jammers) = [];
  GVAR(mobileAntennas) = [];
  GVAR(updateMultiplicatorsPFH) = -1;
  GVAR(blackListAnims) = ["amovppnemstpsraswrfldnon", "aadjppnemstpsraswrfldleft", "aadjppnemstpsraswrfldright"];
};

ADDON = true;
