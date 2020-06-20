#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(systemDisabled) = getMissionConfigValue [QGVAR(disableSystem), false];

if (GVAR(systemDisabled)) then {
  ACEFUNC(medical,setUnconscious) = compileFinal "";
  ACEFUNC(medical,adjustPainLevel) = compileFinal "";
  ACEFUNC(medical,addDamageToUnit) = compileFinal preprocessFileLineNumbers QPATHTOF(functions\fnc_vanillaAddDamageToUnit.sqf);
};

ADDON = true;
