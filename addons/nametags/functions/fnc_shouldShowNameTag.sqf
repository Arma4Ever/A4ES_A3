#include "script_component.hpp"

/*
 * Author: ACE team, SzwedzikPL
 * Return true if target name tag sould be shown
 */

params ["_target"];

(_target isKindOf "CAManBase") &&
{_target isNotEqualTo ace_player} &&
{alive _target} &&
{!(_target getVariable ["ACE_isUnconscious", false])} &&
{((side (group ace_player)) getFriend (side (group _target))) >= 0.6} &&
{
  _target getVariable [
    QGVAR(showNameTag),
    _target getVariable [QEGVAR(common,isPlayer), false]
  ]
}
