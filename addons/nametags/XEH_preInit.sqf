#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(last2DCursorTarget) = objNull;
GVAR(displayInterrupt) = false;
GVAR(interruptingDisplays) = [];

ADDON = true;
