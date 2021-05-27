#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit with highest rank importance from given array
 */

private _highestRankUnit = objNull;
private _highestRank = -1;

if (_this isEqualTo []) exitWith {_highestRankUnit};

{
  private _rankImportance = (_x call FUNC(getUnitRank)) # 2;
  if (_rankImportance > _highestRank) then {
    _highestRank = _rankImportance;
    _highestRankUnit = _x;
  };
} forEach _this;

_highestRankUnit
