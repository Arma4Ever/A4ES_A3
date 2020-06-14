#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sends squadChanged to all members of given squads and given units
 */

private _targets = [];

{
  if (_x isKindOf "CBA_NamespaceDummy") then {
    _targets append (_x call FUNC(getSquadUnits));
  } else {
    _targets pushBack _x;
  };
} forEach _this;

LOG_1("Triggering squad changed event for targets: %1",str _targets);

[QGVAR(squadChanged), [], _targets] call CBA_fnc_targetEvent;
