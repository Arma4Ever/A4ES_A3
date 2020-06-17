#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

#include "initSettings.sqf"

GVAR(settingsInitialized) = false;

GVAR(enable) = false;
GVAR(enabled) = false;
GVAR(currentSquad) = objNull;
GVAR(currentSquadUnits) = [];

GVAR(displayInterrupt) = false;
GVAR(interruptingDisplays) = [];

GVAR(radarPos) = [0,0,0];
GVAR(radarDrawCachePFH) = -1;
GVAR(radarMembersCache) = [];
GVAR(radarDrawCache) = [];
GVAR(lastSpecialStateUnits) = [];

GVAR(memberslistColumns) = [];
