#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

#include "initSettings.sqf"

GVAR(enabled) = false;
GVAR(currentSquad) = objNull;
GVAR(radarPos) = [0,0,0];
GVAR(currentSquadUnits) = [];
GVAR(currentSquadUnitsRadar) = [];

GVAR(radarDrawCachePFH) = -1;
GVAR(radarMembersCache) = [];
GVAR(radarDrawCache) = [];
GVAR(lastSpecialStateUnits) = [];

GVAR(memberslistColumns) = [];
