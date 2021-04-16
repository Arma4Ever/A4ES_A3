#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks is given map an unique map
 */

params ["_item"];

_item isKindOf ["a3cs_map", configFile >> "CfgWeapons"]
