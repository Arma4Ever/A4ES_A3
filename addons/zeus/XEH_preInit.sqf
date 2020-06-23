#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initKeybinds.sqf"

GVAR(pointsResetPFH) = -1;
GVAR(playersIconsDraw) = -1;

GVAR(showPlayerIcons) = false;
GVAR(drawPlayersCache) = [];
GVAR(drawPlayersLastCacheRefresh) = DRAWPLAYERSICONS_CACHE_LIFETIME * -1;

ADDON = true;
