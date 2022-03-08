#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

GVAR(systemEnabled) = getMissionConfigValue [QGVAR(enableSystem), false];

if (GVAR(systemEnabled)) then {
  if (is3DEN) exitWith {};
  LOG("Melee system has been enabled!");
  0 call (compile (preprocessFileLineNumbers '\WebKnight_StarWars_Mechanic\bootstrap\XEH_preInit.sqf'));
};
