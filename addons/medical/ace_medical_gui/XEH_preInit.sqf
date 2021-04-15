#include "\z\ace\addons\medical_gui\script_component.hpp"
#include "\z\a3cs\addons\main\script_ace_override_macros.hpp"

// EDIT
if (getMissionConfigValue ["a3cs_medical_disableSystem", false]) exitWith {};
// EDIT

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "\z\ace\addons\medical_gui\initSettings.sqf"

ADDON = true;
