#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(hiddenTerrainObjects) = [];
GVAR(cacheEnabled) = true;
GVAR(cacheInited) = false;
GVAR(cacheDistanceLand) = 1500;
GVAR(cacheDistanceHelicopters) = 1800;
GVAR(cacheDistancePlanes) = 0;
GVAR(cacheLeaders) = false;
GVAR(cacheGroupIndex) = 0;
GVAR(cacheModules) = [];

ADDON = true;
