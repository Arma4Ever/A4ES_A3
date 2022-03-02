#include "\z\ace\addons\fortify\script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player can fortify.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Cost <NUMBER> (default: 0)
 *
 * Return Value:
 * Can Fortify <BOOL>
 *
 * Example:
 * [player] call ace_fortify_fnc_canFortify
 *
 * Public: Yes
 */

params ["_player", ["_cost", 0]];

("ACE_Fortify" in (_player call EFUNC(common,uniqueItems))) && {
  [_player] call EFUNC(repair,isEngineer)
} && {
  private _budget = [side group _player] call FUNC(getBudget);
  ((_budget == -1) || {_budget >= _cost})
} && {
  [_player] call EFUNC(repair,isNearRepairVehicle)
}
