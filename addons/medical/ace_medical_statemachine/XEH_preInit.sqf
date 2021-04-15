#include "\z\ace\addons\medical_statemachine\script_component.hpp"
#include "\z\a3cs\addons\main\script_ace_override_macros.hpp"

// EDIT
if (getMissionConfigValue ["a3cs_medical_disableSystem", false]) exitWith {};
// EDIT

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "\z\ace\addons\medical_statemachine\initSettings.sqf"

EGVAR(medical,STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call CBA_statemachine_fnc_createFromConfig;

ADDON = true;
