#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(last2DCursorTarget) = objNull;
GVAR(displayInterrupt) = false;
GVAR(interruptingDisplays) = [];

ADDON = true;
