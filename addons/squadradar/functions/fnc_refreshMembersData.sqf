#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members data
 */

LOG("Refreshing members data");

BEGIN_COUNTER(refreshMembersData);

// Update base icons base on units traits and functions
{
  private _icon = switch true do {
      case (_x call EFUNC(squads,isLeader)): {
        "\a3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa"
      };
      case (_x call EFUNC(medical,isMedic)): {
        "\a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa"
      };
      case (_x call ACEFUNC(common,isEngineer)): {
        "\a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa"
      };
      case (_x call ACEFUNC(common,isEOD)): {
        "\a3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa"
      };
      default {
        "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa"
      };
  };

  _x setVariable [QGVAR(baseIcon), _icon];
} forEach GVAR(currentSquadUnits);

END_COUNTER(refreshMembersData);

// Refesh members cache
call FUNC(refreshMembersCache);
