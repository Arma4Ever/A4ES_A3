#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

#include "initSettings.sqf"

GVAR(enabled) = false;
GVAR(currentSquad) = locationNull;
GVAR(memberslistColumns) = [];
