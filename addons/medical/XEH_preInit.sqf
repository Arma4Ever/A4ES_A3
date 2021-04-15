#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(systemDisabled) = getMissionConfigValue [QGVAR(disableSystem), false];
GVAR(localMedicalUnits) = [];
GVAR(localMedicalUnitsLastUpdate) = 0;

if (GVAR(systemDisabled)) then {
  ACEFUNC(medical,setUnconscious) = compileFinal "";
  ACEFUNC(medical,adjustPainLevel) = compileFinal "";
  ACEFUNC(medical,addDamageToUnit) = compileFinal preprocessFileLineNumbers QPATHTOF(functions\fnc_vanillaAddDamageToUnit.sqf);
};

["CAManBase", "init", {
    params ["_unit"];

    if (local _unit) then {
      [{0 call FUNC(updateMedicalLocalUnits)}, []] call CBA_fnc_execNextFrame;
    };
}, true, []] call CBA_fnc_addClassEventHandler;

["CAManBase", "respawn", {
    params ["_unit"];

    if (local _unit) then {
      [{0 call FUNC(updateMedicalLocalUnits)}, []] call CBA_fnc_execNextFrame;
    };
}, true, []] call CBA_fnc_addClassEventHandler;

["CAManBase", "local", {
    [{0 call FUNC(updateMedicalLocalUnits)}, []] call CBA_fnc_execNextFrame;
}, true, []] call CBA_fnc_addClassEventHandler;

["CAManBase", "deleted", {
    params ["_unit"];

    if (local _unit) then {
      [{
        [{0 call FUNC(updateMedicalLocalUnits)}, []] call CBA_fnc_execNextFrame;
      }, []] call CBA_fnc_execNextFrame;
    };
}, true, []] call CBA_fnc_addClassEventHandler;

["CAManBase", "killed", {
    params ["_unit"];

    if (local _unit) then {
      [{0 call FUNC(updateMedicalLocalUnits)}, []] call CBA_fnc_execNextFrame;
    };
}, true, []] call CBA_fnc_addClassEventHandler;

ADDON = true;

/*
// Kill vehicle crew on vehicle destruction
{
  [_x, "Killed", {
    params ["_vehicle"];

    LOG_1('Handling killed event for "%1" vehicle - killing all crew',typeOf _vehicle);

    // Kill all crew
    {
      if ((local _x) && {isDamageAllowed _x}) then {
        _x setDamage 1;
      };
    } forEach (crew _vehicle);
  }] call CBA_fnc_addClassEventHandler;
} forEach ["Air", "Car", "Tank", "Ship"];
*/
