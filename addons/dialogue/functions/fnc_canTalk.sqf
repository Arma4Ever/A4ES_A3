#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can talk with unit
 */

params ["_unit", "_player"];

alive _unit &&
{!(isPlayer _unit)} &&
{(_unit call FUNC(getUnitDialogue)) != ""} &&
{!(_unit getVariable ["ACE_isUnconscious", false])} &&
{isNull (_unit getVariable [QGVAR(talkingWith), objNull])} &&
{isNull (_player getVariable [QGVAR(talkingWith), objNull])}
