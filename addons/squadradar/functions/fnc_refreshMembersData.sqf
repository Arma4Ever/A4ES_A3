#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members data
 */

LOG("Refreshing members data");

BEGIN_COUNTER(refreshMembersData);

// Update base icons base on units traits and functions
{
  _x setVariable [
    QGVAR(baseIcon),
    _x call {
      if (_this call EFUNC(squads,isLeader)) exitWith {
        "\a3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa"
      };
      if (_this call EFUNC(medical,isMedic)) exitWith {
        "\a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa"
      };
      if (_this call ACEFUNC(common,isEngineer)) exitWith {
        "\a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa"
      };
      if (_this call ACEFUNC(common,isEOD)) exitWith {
        "\a3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa"
      };

      "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa"
    }
  ];
} forEach GVAR(currentSquadUnits);

END_COUNTER(refreshMembersData);

// Refesh members cache
call FUNC(refreshMembersCache);
