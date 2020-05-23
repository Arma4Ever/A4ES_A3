#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(systemDisabled) = getNumber (missionConfigFile >> QGVAR(disableSystem)) == 1;

ADDON = true;
