#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(systemDisabled) = getMissionConfigValue [QGVAR(disableSystem), false];

ADDON = true;
