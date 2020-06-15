#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members data
 */

LOG("Refreshing members data");

BEGIN_COUNTER(refreshMembersData);

// Update base icons base on units traits and functions
{
  private _icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

  if (_x call EFUNC(squads,isLeader)) then {
    _icon = "\a3\ui_f\data\map\vehicleicons\iconmanleader_ca.paa";
  };

  _x setVariable [QGVAR(baseIcon), _icon];
} forEach GVAR(currentSquadUnits);

BEGIN_COUNTER(refreshMembersData);

// Refesh members cache
call FUNC(refreshMembersCache);
