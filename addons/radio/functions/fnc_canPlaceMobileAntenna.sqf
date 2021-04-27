#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can place mobile antenna
 */

params ["_target", "_player"];
TRACE_2("canPlaceMobileAntenna",_target,_player);

("tfw_rf3080Item" in (itemsWithMagazines _player)) &&
{isNull (objectParent _player)} &&
{!(_player getVariable ["ACE_isUnconscious", false])}
