#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"
#include "initSettings.sqf"

GVAR(disabledInMission) = getMissionConfigValue [QGVAR(disableSquadRadar), false];
GVAR(showHelpToEveryone) = getMissionConfigValue [QGVAR(showHelpIconToEveryone), false];
GVAR(disableHelpIconFOVCheck) = getMissionConfigValue [QGVAR(disableHelpIconFOVCheck), false];

GVAR(settingsInitialized) = false;

GVAR(enable) = false;
GVAR(showFingerPointers) = false;

GVAR(enabled) = false;
GVAR(currentSquad) = objNull;
GVAR(currentSquadUnits) = [];
GVAR(showCurrentSquad) = false;

GVAR(displayInterrupt) = false;
GVAR(interruptingDisplays) = [];

GVAR(radarPos) = [0,0,0];
GVAR(radarDrawCachePFH) = -1;
GVAR(membersCache) = [];
GVAR(radarDrawCache) = [];
GVAR(lastSpecialStateUnits) = [];
GVAR(radarJammed) = false;
GVAR(memberlistJammed) = false;

ADDON = true;
