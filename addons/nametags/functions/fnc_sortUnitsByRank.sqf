#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sorts given units by rank importance
 */

params ["_units", ["_mode", 0, [0]]];

private _sortMode = ["ASCEND", "DESCEND"] select (_mode isEqualTo 0);

[_units, [], {
  (_x call FUNC(getUnitRank)) # 2
}, _sortMode] call BIS_fnc_sortBy
