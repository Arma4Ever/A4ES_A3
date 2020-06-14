#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members cache
 */

LOG("Refreshing members cache");

{
  private _icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

  if (_x call EFUNC(squads,isSquadLeader)) then {
    _icon = "\a3\3den\data\attributes\namesound\special_ca.paa";
  };

  _x setVariable [QGVAR(baseIcon), _icon];
} forEach allUnits;

call FUNC(refreshMembersStateIcons);
