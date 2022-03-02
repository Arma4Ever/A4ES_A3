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
    {local _group} &&
    {(units _group) isEqualTo []} &&
    {!(_group getVariable [QEGVAR(common,playerGroup), false])}
  ) then {
    TRACE_1("cleanupEmptyGroups - delete group",_group);
    deleteGroup _group;
  };
  sleep 0.001;
} forEach _groups;

// Schedule next check
[{0 spawn FUNC(cleanupEmptyGroups)}, [], EMPTY_GROUPS_CLEANUP_INTERVAL] call CBA_fnc_waitAndExecute;
