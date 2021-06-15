#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (is3DENPreview) then {
  GVAR(showLogs) = true;
  GVAR(showDebugMap) = true;
  GVAR(logs) = [];

  GVAR(entitiesDrawData) = [];
  GVAR(modulesDrawData) = [];
  GVAR(triggersDrawData) = [];
};

ADDON = true;
