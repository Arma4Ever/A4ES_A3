#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members cache
 */

LOG("Refreshing members cache");

BEGIN_COUNTER(refreshMembersCache);

// Update base icons base on units traits and functions
{
  private _icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

  if (_x call EFUNC(squads,isLeader)) then {
    _icon = "\a3\3den\data\attributes\namesound\special_ca.paa";
  };

  _x setVariable [QGVAR(baseIcon), _icon];
} forEach GVAR(currentSquadUnits);

BEGIN_COUNTER(refreshMembersCache);

// Refesh members data cache
call FUNC(refreshMembersStateCache);
