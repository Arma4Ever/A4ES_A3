#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes empty groups (more aggressive than vanilla group removal)
 */

LOG("cleanupEmptyGroups");

private _groups = allGroups;
{
  private _group = _x;
  if (
    !(isNull _group) &&
    // Don't remove logic groups
    {(side _group) isNotEqualTo sideLogic} &&
    // Remove only empty groups where every unit is in remains collector (not playable/marked by MM)
    {({!(!(alive _x) && isInRemainsCollector _x)} count (units _group)) isEqualTo 0}
  ) then {
    [QEGVAR(common,deleteGroup), _group, _group] call CBA_fnc_targetEvent;
  };
  sleep 0.1;
} forEach _groups;

// Schedule next check
[{0 spawn FUNC(cleanupEmptyGroups)}, [], EMPTY_GROUPS_CLEANUP_INTERVAL] call CBA_fnc_waitAndExecute;
