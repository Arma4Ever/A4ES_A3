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

// Kill vehicle crew on vehicle destruction
{
  [_x, "Killed", {
    params ["_vehicle"];
    // Exit if vehicle not local
    if (!(local _vehicle)) exitWith {};

    LOG_1('Handling killed event for "%1" vehicle - killing all crew',typeOf _vehicle);

    // Kill all crew
    {
      _x setDamage 1;
    } forEach (crew _vehicle);
  }] call CBA_fnc_addClassEventHandler;
} forEach ["Air", "Car", "Tank", "Ship"];
