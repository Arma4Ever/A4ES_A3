#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
  GVAR(simpleBodiesGroup) = grpNull;
  GVAR(simpleBodies) = [];
  GVAR(simpleBodiesLimit) = 100;
};

ADDON = true;
