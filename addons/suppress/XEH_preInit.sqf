#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
  GVAR(suppressedEH) = -1;
};

ADDON = true;
