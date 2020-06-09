#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(systemDisabled) = getNumber (missionConfigFile >> QGVAR(disableSystem)) == 1;

ADDON = true;
