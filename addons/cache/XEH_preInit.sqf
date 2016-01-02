#include "script_component.hpp"

ADDON = false;

PREP(cacheUnit);
PREP(checkGroupCache);
PREP(initCache);
PREP(module_cacheSettings);
PREP(uncacheUnit);

GVAR(enabled) = false;
GVAR(cachedGroups) = [];
GVAR(allGroups) = [];

ADDON = true;
