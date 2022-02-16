#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
  GVAR(blackListAnims) = ["amovppnemstpsraswrfldnon", "aadjppnemstpsraswrfldleft", "aadjppnemstpsraswrfldright"];
};

ADDON = true;
