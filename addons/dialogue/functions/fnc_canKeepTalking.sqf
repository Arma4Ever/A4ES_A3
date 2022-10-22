#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can keep talking with given unit
 */

params ["_unit", "_player"];

alive _unit &&
{alive _player} &&
{!(isNull (uiNamespace getVariable [QGVAR(uiDisplay), displayNull]))} &&
{!(_unit getVariable ["ACE_isUnconscious", false])} &&
{!(_player getVariable ["ACE_isUnconscious", false])} &&
{(_unit getVariable [QGVAR(talkingWith), objNull]) isEqualTo _player} &&
{(_player getVariable [QGVAR(talkingWith), objNull]) isEqualTo _unit}
