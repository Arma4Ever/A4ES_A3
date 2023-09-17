#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members data
 */

LOG("Refreshing members data");

BEGIN_COUNTER(refreshMembersData);

private _iconClassesCfg = configFile >> QGVAR(iconClasses);

// Update base icons base on units traits and functions
private ["_baseIcon", "_baseIconClass"];
{

  _baseIcon = _x getVariable [QGVAR(customBaseIcon), ""];
  if (_baseIcon isEqualTo "") then {
    _baseIconClass = _x getVariable [QGVAR(baseIconClass), ""];
    if (_baseIconClass isEqualTo "") then {
      _baseIconClass = _x call {
        if (_this call EFUNC(squads,isLeader)) exitWith {
          "squadleader"
        };
        if (_this call ACEFUNC(medical_treatment,isMedic)) exitWith {
          "medic"
        };
        if (_this call ACEFUNC(common,isEngineer)) exitWith {
          "engineer"
        };
        if (_this call ACEFUNC(common,isEOD)) exitWith {
          "eod"
        };

        "rifleman"
      };
    };

    _baseIcon = getText (_iconClassesCfg >> _baseIconClass >> "icon");
  };

  _x setVariable [QGVAR(baseIcon), _baseIcon];
} forEach GVAR(currentSquadUnits);

END_COUNTER(refreshMembersData);

// Refesh members cache
call FUNC(refreshMembersCache);
