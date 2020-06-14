#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sends squadChanged to all members of given squads and given units
 */

private _targets = [];

{
  if (_x isEqualType objNull) then {
    _targets pushBack _x;
  } else {
    _targets append (_x call FUNC(getSquadUnits));
  };
} forEach _this;

[QGVAR(squadChanged), 0, _targets] call CBA_fnc_targetEvent;
