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

// Remove duplicates
_targets = _targets arrayIntersect _targets;

LOG_1("Triggering squad changed event for targets: %1",str _targets);

// Delay changed trigger to give time for proper squad data sync
[{
  [QGVAR(squadChanged), [], _this] call CBA_fnc_targetEvent;
}, _targets, 0.5] call CBA_fnc_waitAndExecute;
