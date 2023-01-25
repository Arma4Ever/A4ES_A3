#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can place mobile artillery radar
 */

params ["_target", "_player"];
TRACE_2("canPlaceMobileRadar",_target,_player);

("a4es_mobileArtilleryRadarItem" in (itemsWithMagazines _player)) &&
{isNull (objectParent _player)} &&
{!(_player getVariable ["ACE_isUnconscious", false])}
